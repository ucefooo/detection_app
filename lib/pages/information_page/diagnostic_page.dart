import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

class DiagnosticPage extends StatelessWidget {
  const DiagnosticPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerGradientColors = isDarkMode 
        ? [Colors.purple.shade900, Colors.purple.shade800]
        : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).diagnostic),
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
                    translation(context).transmissioncyclestep19,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translation(context).transmissioncyclestep20,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DiagnosticMethodCard(
                    title: translation(context).transmissioncyclestep21,
                    mainDescription: translation(context).transmissioncyclestep22,
                    details: [
                      translation(context).transmissioncyclestep23,
                      translation(context).transmissioncyclestep24,
                      translation(context).transmissioncyclestep25,
                      translation(context).transmissioncyclestep26
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: translation(context).transmissioncyclestep27,
                    mainDescription: translation(context).transmissioncyclestep28,
                    details: [
                      translation(context).transmissioncyclestep29,
                      translation(context).transmissioncyclestep30,
                      translation(context).transmissioncyclestep31,
                      translation(context).transmissioncyclestep32,
                      translation(context).transmissioncyclestep33
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: translation(context).transmissioncyclestep34,
                    mainDescription: translation(context).transmissioncyclestep35,
                    details: [
                      translation(context).transmissioncyclestep36,
                      translation(context).transmissioncyclestep37,
                      translation(context).transmissioncyclestep38,
                      translation(context).transmissioncyclestep39,
                      translation(context).transmissioncyclestep40
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: translation(context).transmissioncyclestep41,
                    mainDescription: translation(context).transmissioncyclestep42,
                    details: [
                      translation(context).transmissioncyclestep43,
                      translation(context).transmissioncyclestep44,
                      translation(context).transmissioncyclestep45,
                      translation(context).transmissioncyclestep46
                    ],
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

class DiagnosticMethodCard extends StatelessWidget {
  final String title;
  final String mainDescription;
  final List<String> details;

  const DiagnosticMethodCard({
    super.key,
    required this.title,
    required this.mainDescription,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          mainDescription,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.map((detail) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Changed to center
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2), // Small adjustment to align with text
                      child: const Icon(Icons.circle, size: 6), // Reduced size
                    ),
                    const SizedBox(width: 12), // Increased spacing
                    Expanded(
                      child: Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.3, // Reduced line height
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}