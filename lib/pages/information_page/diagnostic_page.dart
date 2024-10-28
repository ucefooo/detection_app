import 'package:flutter/material.dart';

class DiagnosticPage extends StatelessWidget {
  const DiagnosticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerGradientColors = isDarkMode 
        ? [Colors.purple.shade900, Colors.purple.shade800]
        : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic Methods'),
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
                    'Diagnostic Methods',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Different methods for diagnosing Leishmaniasis:',
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
                  DiagnosticMethodCard(
                    title: 'Microscopy',
                    mainDescription: 'Direct Examination (Giemsa)',
                    details: [
                      'Standard microscopy setup for sample examination',
                      'Uses Giemsa staining technique',
                      'Direct visualization of parasites',
                      'Traditional and reliable method'
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: 'Molecular Techniques',
                    mainDescription: 'DNA/RNA-based Detection Methods',
                    details: [
                      'PCR and PCR-RFLP for DNA analysis',
                      'LAMP technique for amplification',
                      'RT-PCR for RNA detection',
                      'MLST for strain typing',
                      'NGS for comprehensive genetic analysis'
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: 'Culture',
                    mainDescription: 'Growth Media Methods',
                    details: [
                      'Novy-MacNeal-Nicolle (NNN)',
                      'Roswell Park Memorial Institute (RPMI)',
                      'Uses specialized growth media',
                      'Includes biopsy samples',
                      'Requires specific conditions and antibiotics'
                    ],
                  ),
                  const SizedBox(height: 16),
                  DiagnosticMethodCard(
                    title: 'Rapid Diagnostic Test',
                    mainDescription: 'RDT Analysis',
                    details: [
                      'Serum separation process',
                      'Immunochromatographic detection',
                      'Quick results in field conditions',
                      'Simple positive/negative readout'
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