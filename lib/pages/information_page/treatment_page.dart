import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerGradientColors = isDarkMode 
        ? [Colors.purple.shade900, Colors.purple.shade800]
        : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).treatment),
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
                    translation(context).transmissioncyclestep51,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translation(context).transmissioncyclestep52,
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
                  TreatmentMethodCard(
                    title: translation(context).transmissioncyclestep53,
                    mainDescription: translation(context).transmissioncyclestep54,
                    details: [
                      translation(context).transmissioncyclestep55,
                      translation(context).transmissioncyclestep56,
                      translation(context).transmissioncyclestep57,
                      translation(context).transmissioncyclestep58
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: translation(context).transmissioncyclestep59,
                    mainDescription: translation(context).transmissioncyclestep60,
                    details: [
                      translation(context).transmissioncyclestep61,
                      translation(context).transmissioncyclestep62,
                      translation(context).transmissioncyclestep63,
                      translation(context).transmissioncyclestep64,
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: translation(context).transmissioncyclestep65,
                    mainDescription: translation(context).transmissioncyclestep66,
                    details: [
                      translation(context).transmissioncyclestep67,
                      translation(context).transmissioncyclestep68,
                      translation(context).transmissioncyclestep69,
                      translation(context).transmissioncyclestep70,
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: translation(context).transmissioncyclestep71,
                    mainDescription: translation(context).transmissioncyclestep72,
                    details: [
                      translation(context).transmissioncyclestep73,
                      translation(context).transmissioncyclestep74,
                      translation(context).transmissioncyclestep75,
                      translation(context).transmissioncyclestep76,
                      translation(context).transmissioncyclestep77,
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

class TreatmentMethodCard extends StatelessWidget {
  final String title;
  final String mainDescription;
  final List<String> details;

  const TreatmentMethodCard({
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      child: const Icon(Icons.circle, size: 6),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.3,
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