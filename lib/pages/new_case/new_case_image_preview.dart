import 'package:detection_app/pages/new_case/new_case_lodaing_analyze.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImagePreviewPage extends StatelessWidget {
  final File imageFile;
  final VoidCallback onCancel;

  const ImagePreviewPage(
      {super.key, required this.imageFile, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          onCancel();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image.file(
              //   imageFile,
              //   fit: BoxFit.cover,
              // ),
              _buildImageWidget(),
              _buildOverlay(),
              _buildControls(context),
            ],
          ),
        ),
      ),
    );
  }

   Widget _buildImageWidget() {
    return FutureBuilder<bool>(
      future: imageFile.exists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return Image.file(
              imageFile,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return Center(child: Text('Error loading image: $error'));
              },
            );
          } else {
            print('Image file does not exist');
            return Center(child: Text('Image file not found'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.1),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeader(context),
        _buildBottomBar(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 40),
          onPressed: () {
            onCancel();
            Navigator.pop(context);
          },
        ),
        Text(
          'Image Preview',
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(width: 48), // Placeholder for symmetry
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add cancel functionality here
                    onCancel();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFC5F5F),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 40),
                    // maximumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Re-take photo',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                // SizedBox(width: 10), // Add small gap between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add next step functionality here
                    // Navigator.of(context,rootNavigator: true).pushNamed('case2');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnalyzeLoadingPage(
                          imageFile: imageFile,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B57A),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Analyze',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
