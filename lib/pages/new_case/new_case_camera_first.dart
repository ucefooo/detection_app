import 'package:detection_app/pages/new_case/new_case_image_preview.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'dart:io';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  File? _selectedImg;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future _pickFromGallery() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img == null) {
      setState(() {
        _selectedImg = null;
      });
      return;
    }
    setState(() {
      _selectedImg = File(img.path);
    });
    _navigateToPreview();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw CameraException(
            'No cameras found', 'No cameras available on this device');
      }
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller!.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
      // You might want to show an error message to the user here
    }
  }

  Future<String?> _getDownloadsPath() async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
        // Fallback to app-specific directory if the above doesn't exist
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      } else {
        // directory = await getApplicationDocumentsDirectory();
        final appDocDir = await getApplicationDocumentsDirectory();
        final downloadsDir = Directory('${appDocDir.path}/Downloads');

        // Create the directory if it doesn't exist
        if (!await downloadsDir.exists()) {
          await downloadsDir.create(recursive: true);
        }
        return downloadsDir.path;
      }
    } catch (e) {
      print('Could not access the downloads directory: $e');
    }
    return directory?.path;
  }

  void _navigateToPreview() {
    if (_selectedImg != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewPage(
            imageFile: _selectedImg!,
            onCancel: () {
              setState(() {
                _selectedImg = null; // Reset the selected image
              });
            },
          ),
        ),
      );
    }
  }

  Future<void> _captureImage() async {
    if (!_controller!.value.isInitialized) return;
    final image = await _controller!.takePicture();
    setState(() {
      _selectedImg = File(image.path);
    });
    _navigateToPreview();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _initializeControllerFuture == null
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        CameraPreview(_controller!),
                        // _buildCameraPreview(),
                        _buildOverlay(),
                        _buildTopBar(),
                        _buildBottomBar(),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
    );
  }

  Widget _buildOverlay() {
    // Check if there is a selected image
    if (_selectedImg != null) {
      return Center(
        child: Image.file(
          File(_selectedImg!.path),
          fit: BoxFit.contain, // Adjust the fit as needed
          width: 250,
          height: 250,
        ),
      );
    }

    // If no image is selected, display the original overlay
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Please focus the desired area\ninside the box for better analysis',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 60,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 40),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.flip_camera_ios_outlined,
                  color: Colors.white, size: 40),
              onPressed: () async {
                // TODO: Implement camera switch
                if (_controller == null || _controller!.value.isTakingPicture) {
                  return; // Prevent switching if the camera is not initialized or is taking a picture
                }
                try {
                  // Dispose of the current camera controller
                  WidgetsFlutterBinding.ensureInitialized();
                  final cameras = await availableCameras();
                  if (cameras.isEmpty) {
                    throw CameraException('No cameras found',
                        'No cameras available on this device');
                  }
                  if (cameras.length < 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Only one camera available')),
                    );
                    return;
                  }
                  await _controller?.dispose();

                  // Get the list of available cameras

                  // Determine the new camera lens direction to switch to
                  CameraDescription? newCamera;
                  final lensDirection = _controller!.description.lensDirection;

                  if (lensDirection == CameraLensDirection.front) {
                    // Switch to back camera if available
                    newCamera = cameras.firstWhere((camera) =>
                        camera.lensDirection == CameraLensDirection.back);
                  } else {
                    // Switch to front camera if available
                    newCamera = cameras.firstWhere((camera) =>
                        camera.lensDirection == CameraLensDirection.front);
                  }

                  // Initialize the new camera
                  _controller = CameraController(
                    newCamera,
                    ResolutionPreset.medium,
                  );

                  // Reinitialize the camera
                  _initializeControllerFuture = _controller!.initialize();
                  setState(() {});
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error switching camera: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryButton() {
    return Column(
      children: [
        InkWell(
          onTap: _pickFromGallery,
          child: Container(
            width: 50, // Set the width and height for the square button
            height: 50,
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2FCE90), width: 2),
              borderRadius: BorderRadius.circular(15),
              image: null,
            ),
            child: const Icon(Icons.photo, color: Color(0xFF2FCE90)),
          ),
        ),
        // const SizedBox(height: 5),
        const Text(
          'Gallery',
          style: TextStyle(color: Color(0xFF2FCE90)),
        ),
      ],
    );
  }

  Widget _buildCameraButton(Color textColor) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: const Color(0xFF2FCE90),
          shape: const CircleBorder(),
          child: Icon(Icons.photo_camera_outlined, color: textColor, size: 36),
          onPressed: () async {
            if (_controller == null || !_controller!.value.isInitialized) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error: Camera not initialized')),
              );
              return;
            }

            try {
              final image = await _controller!.takePicture();
              final String? downloadsPath = await _getDownloadsPath();
              if (downloadsPath == null) {
                throw Exception('Could not access the downloads directory');
              }

              final String fileName =
                  'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
              final String filePath = path.join(downloadsPath, fileName);

              await File(image.path).copy(filePath);
              await File(image.path).delete();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Picture saved to $filePath')),
              );
              // TODO: Handle the captured image
              setState(() {
                _selectedImg = File(filePath);
              });
              _navigateToPreview();
              print('Picture saved to ${image.path}');
            } catch (e) {
              print('Error taking picture: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error taking picture: $e')),
              );
            }
          },
        ),
        const SizedBox(height: 10),
        // const Text(
        //   'Take Picture',
        //   style: TextStyle(color: Color(0xFF2FCE90), fontSize: 16),
        // ),
      ],
    );
  }

  Widget buildTipsButton() {
    return Column(
      children: [
        InkWell(
          onTap: _pickFromGallery,
          child: Container(
            width: 50, // Set the width and height for the square button
            height: 50,
            // color: Colors.black,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2FCE90), width: 2),
              borderRadius: BorderRadius.circular(25),
              image: null,
            ),
            child: const Icon(
              Icons.question_mark_outlined,
              color: Color(0xFF2FCE90),
              size: 30,
            ),
          ),
        ),
        // const SizedBox(height: 5),
        const Text(
          'Tips',
          style: TextStyle(color: Color(0xFF2FCE90), fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.black : Colors.white;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        color: textColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // TextButton(
                //   onPressed: _pickFromGallery,
                //   child: const Text('gallery',
                //       style: TextStyle(color: Colors.black)),
                // ),
                _buildGalleryButton(),
                _buildCameraButton(textColor),
                buildTipsButton(),
                // FloatingActionButton(
                //   backgroundColor: Colors.green,
                //   child: const Icon(Icons.camera, size: 36),
                //   onPressed: () async {
                //     if (_controller == null ||
                //         !_controller!.value.isInitialized) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //             content: Text('Error: Camera not initialized')),
                //       );
                //       return;
                //     }

                //     try {
                //       final image = await _controller!.takePicture();
                //       final String? downloadsPath = await _getDownloadsPath();
                //       if (downloadsPath == null) {
                //         throw Exception(
                //             'Could not access the downloads directory');
                //       }

                //       final String fileName =
                //           'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
                //       final String filePath =
                //           path.join(downloadsPath, fileName);

                //       await File(image.path).copy(filePath);
                //       await File(image.path).delete();

                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Picture saved to $filePath')),
                //       );
                //       // TODO: Handle the captured image
                //       print('Picture saved to ${image.path}');
                //     } catch (e) {
                //       print('Error taking picture: $e');
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Error taking picture: $e')),
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
