import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

class ClinicalPage extends StatelessWidget {
  const ClinicalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shadowColor = isDarkMode ? Colors.purple.withOpacity(0.3) : Colors.blue.withOpacity(0.2);
    final headerGradientColors = isDarkMode 
        ? [Colors.purple.shade900, Colors.purple.shade800]
        : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).clinical),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: headerGradientColors,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).transmissioncyclestep11,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translation(context).transmissioncyclestep12,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ClinicalFormCard(
                    title: translation(context).transmissioncyclestep13,
                    description: translation(context).transmissioncyclestep14,
                    imagePath: 'assets/visceral.png',
                    shadowColor: shadowColor,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),
                  ClinicalFormCard(
                    title: translation(context).transmissioncyclestep15,
                    description: translation(context).transmissioncyclestep16,
                    imagePath: 'assets/cutaneous.png',
                    shadowColor: shadowColor,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),
                  ClinicalFormCard(
                    title: translation(context).transmissioncyclestep17,
                    description: translation(context).transmissioncyclestep18,
                    imagePath: 'assets/mucocutaneous.png',
                    shadowColor: shadowColor,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClinicalFormCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color shadowColor;
  final bool isDarkMode;

  const ClinicalFormCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.shadowColor,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: shadowColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}