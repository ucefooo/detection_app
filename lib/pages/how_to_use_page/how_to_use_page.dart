import 'package:flutter/material.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({Key? key}) : super(key: key);

  @override
  _HowToUsePageState createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
  Widget _buildClickableItem(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {}, // Empty onTap to make it appear clickable
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to Use Our Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              'Follow these steps to use our application:',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            _buildClickableItem('1. Access the menu'),
            _buildClickableItem('2. Go to "New Case"'),
            _buildClickableItem('3. Choose a body part'),
            _buildClickableItem('4. Click "Next"'),
            _buildClickableItem('5. Take a photo or choose from gallery'),
            const Text(
              '6. You can retake the photo or click "Analyze"',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '7. Wait for the result',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'After receiving the result, you can:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildClickableItem('• Click "Re-do Test" to start over'),
            _buildClickableItem('• Click "Finish Test" to return to homepage'),
            _buildClickableItem('• Click "Save case" to save the result'),
            const SizedBox(height: 8),
            const Text(
              'Note: Clicking "Finish" or "Re-do Test" won\'t save the test.',
              style: TextStyle(fontSize: 16, color: Colors.red, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            const Text(
              'Additional Features:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            _buildClickableItem('• Access "Saved cases" in the menu'),
            const Text(
              '  Review, unsave, or share saved results',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem('• Access "Unsaved cases" in the menu'),
            const Text(
              '  View and optionally save unsaved cases',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem('• Use "Need help" in the menu'),
            const Text(
              '  Send us a message if you need help',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem('• Change Language'),
            const Text(
              '  Switch between Arabic, English, or French in settings\n'
              '  or use the button at the top of the app',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem('• Choose Theme'),
            const Text(
              '  Select between Light or Dark mode in settings',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}