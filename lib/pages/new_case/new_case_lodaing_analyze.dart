import 'package:detection_app/pages/new_case/new_case_result.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AnalyzeLoadingPage extends StatelessWidget {
  final File imageFile;
  final String results = '80% possibility';

  const AnalyzeLoadingPage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildControls(context)),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildHeader(context),
        _buildOverlay(),
        _buildBottomBar(),
        _buildBottomBarText(),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewCaseResult(
                  imageFile: imageFile,
                  results: results,
                ),
              ),
            );
          },
          child: const Icon(Icons.next_plan_outlined),
        ),
      ],
    );
  }

  Widget _buildOverlay() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 350,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              20), // Match the borderRadius of the Container
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.close, size: 40),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    "Are you sure you want to cancel the new test?",
                    style:
                        TextStyle(fontSize: 16), // Adjust font size if needed
                  ),
                  content:
                      const Text('Do you want to discard the current test?'),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                            backgroundColor: const Color(0xFFFC5F5F),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(120, 40),
                            maximumSize: const Size(120, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Cancel test',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                            backgroundColor: const Color(0xFF00B57A),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(120, 40),
                            maximumSize: const Size(120, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        const Text(
          'Analyzing...',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 48), // Placeholder for symmetry
      ],
    );
  }

  Widget _buildBottomBar() {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Text(
        'Analyzing your photo',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00B57A)),
      ),
    );
  }

  Widget _buildBottomBarText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        'please be patient,\nit may take some time...',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 134, 134, 134),
        ),
      ),
    );
  }
}
