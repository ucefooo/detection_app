import 'package:flutter/material.dart';

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
        title: const Text('Treatment Methods'),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Treatment Methods',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Available treatments for Leishmaniasis:',
                    style: TextStyle(
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
                    title: 'Antimonial Drugs',
                    mainDescription: 'Primary Treatment Option',
                    details: [
                      'Meglumine antimoniate is commonly prescribed',
                      'Effectiveness varies by region',
                      'Requires careful monitoring due to side effects',
                      'Duration of treatment depends on disease form'
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: 'Amphotericin B',
                    mainDescription: 'Severe Case Treatment',
                    details: [
                      'Primarily used for visceral leishmaniasis',
                      'Available in different formulations',
                      'Requires hospital administration',
                      'Effective in antimony-resistant cases'
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: 'Oral Treatments',
                    mainDescription: 'Miltefosine and Others',
                    details: [
                      'Miltefosine as primary oral option',
                      'Availability varies by region',
                      'Requires complete course completion',
                      'Alternative when other treatments fail'
                    ],
                  ),
                  const SizedBox(height: 16),
                  TreatmentMethodCard(
                    title: 'Supportive Care',
                    mainDescription: 'Symptom Management',
                    details: [
                      'Management of complications',
                      'Nutritional support',
                      'Pain management when needed',
                      'Regular monitoring of vital signs',
                      'Prevention of secondary infections'
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