import 'package:flutter/material.dart';

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
        title: const Text('Clinical Forms'),
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
                    'Clinical Forms',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Leishmaniasis is caused by a protozoa parasite from over 20 Leishmania species. Over 90 sandfly species are known to transmit Leishmania parasites. There are 3 main forms of the disease:',
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
                    title: 'Visceral Leishmaniasis (VL)',
                    description: 'VL, also known as kala-azar, is fatal if left untreated in over 95% of cases. It is characterized by irregular bouts of fever, weight loss, enlargement of the spleen and liver, and anaemia. Most cases occur in Brazil, east Africa and India. An estimated 50 000 to 90 000 new cases of VL occur worldwide annually, with only 25–45% reported to WHO. It has outbreak and mortality potential.',
                    imagePath: 'assets/visceral.png',
                    shadowColor: shadowColor,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),
                  ClinicalFormCard(
                    title: 'Cutaneous Leishmaniasis (CL)',
                    description: 'CL is the most common form and causes skin lesions, mainly ulcers, on exposed parts of the body. These can leave life-long scars and cause serious disability or stigma. About 95% of CL cases occur in the Americas, the Mediterranean basin, the Middle East and central Asia. It is estimated that 600 000 to 1 million new cases occur worldwide annually but only around 200 000 are reported to WHO.',
                    imagePath: 'assets/cutaneous.png',
                    shadowColor: shadowColor,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),
                  ClinicalFormCard(
                    title: 'Mucocutaneous Leishmaniasis',
                    description: 'Leads to partial or total destruction of mucous membranes of the nose, mouth and throat. Over 90% of mucocutaneous leishmaniasis cases occur in Bolivia, Brazil, Ethiopia and Peru.',
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