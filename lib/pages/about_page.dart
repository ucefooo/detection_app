import 'package:detection_app/classes/language_constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translation(context).needHelp,
            ),
            const SizedBox(height: 16),
            Text(
              'dsdsdsd'
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add any action you want here
                setState(() {
                  // Update state if needed
                });
              },
              child: Text('click'),
            ),
          ],
        ),
      ),
    );
  }
}