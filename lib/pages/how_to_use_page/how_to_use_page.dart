import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({super.key});

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
            Text(
              translation(context).howToUseHeader,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Text(
              translation(context).howToUseInstructions,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            _buildClickableItem(translation(context).howToUseStep1),
            _buildClickableItem(translation(context).howToUseStep2),
            _buildClickableItem(translation(context).howToUseStep3),
            _buildClickableItem(translation(context).howToUseStep4),
            _buildClickableItem(translation(context).howToUseStep5),
            Text(
              translation(context).howToUseStep6,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              translation(context).howToUseStep7,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              translation(context).howToUseStep8,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildClickableItem(translation(context).howToUseRedoTest),
            _buildClickableItem(translation(context).howToUseSaveCase),
            _buildClickableItem(translation(context).howToUseShareResults),
            const SizedBox(height: 8),
            Text(
              translation(context).howToUseNote,
              style: const TextStyle(fontSize: 16, color: Colors.red, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              translation(context).howToUseAdditionalFeatures,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            _buildClickableItem(translation(context).howToUseSavedCases),
            Text(
              translation(context).howToUseSavedCasesInstructions,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem(translation(context).howToUseUnsavedCases),
            Text(
              translation(context).howToUseUnsavedCasesInstructions,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem(translation(context).howToUseNeedHelp),
            Text(
              translation(context).howToUseNeedHelpInstructions,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem(translation(context).howToUseChangeLanguage),
            Text(
              translation(context).howToUseChangeLanguageInstructions,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            _buildClickableItem(translation(context).howToUseChooseTheme),
            Text(
              translation(context).howToUseChooseThemeInstructions,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}