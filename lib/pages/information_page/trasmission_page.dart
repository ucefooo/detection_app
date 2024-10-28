import 'package:flutter/material.dart';

class TransmissionPage extends StatelessWidget {
  const TransmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shadowColor = isDarkMode ? Colors.purple.withOpacity(0.3) : Colors.blue.withOpacity(0.2);
    final headerGradientColors = isDarkMode 
      ? [Colors.purple.shade900, Colors.purple.shade800]
      : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transmission Cycle'),
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
                    'How It Spreads',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Understanding the Transmission Cycle',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shadowColor: shadowColor,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'The transmission of leishmaniasis occurs through the bite of an infected female sand fly. When the fly bites a person or an animal carrying the parasite, it ingests the parasite, which then develops in the fly\'s gut. Once mature, the parasites travel to the fly\'s mouthparts, enabling transmission to a new host through another bite, continuing the cycle.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    shadowColor: shadowColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Transmission Cycle Steps',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CycleStep(
                          number: "1",
                          title: "Sand Fly Stage",
                          description: "Le phlébotome prend un repas de sang",
                          isLeft: true,
                          isDarkMode: isDarkMode,
                        ),
                        CycleStep(
                          number: "2",
                          title: "Human Stage",
                          description: "Les promastigotes sont phagocytés par les macrophages",
                          isLeft: false,
                          isDarkMode: isDarkMode,
                        ),
                        CycleStep(
                          number: "3",
                          title: "Transformation",
                          description: "Les promastigotes se transforment en amastigotes dans les macrophages",
                          isLeft: true,
                          isDarkMode: isDarkMode,
                        ),
                        CycleStep(
                          number: "4",
                          title: "Multiplication",
                          description: "Les amastigotes se multiplient dans les cellules",
                          isLeft: false,
                          isDarkMode: isDarkMode,
                        ),
                        CycleStep(
                          number: "5",
                          title: "Ingestion",
                          description: "Ingestion de macrophages infectés par des amastigotes",
                          isLeft: true,
                          isDarkMode: isDarkMode,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    shadowColor: shadowColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 24,
                            color: isDarkMode ? Colors.purple : Colors.blue,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'This cycle represents both the infective and diagnostic stages of leishmaniasis transmission.',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class CycleStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final bool isLeft;
  final bool isDarkMode;

  const CycleStep({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.isLeft,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final numberBgColor = isDarkMode 
        ? Colors.purple.withOpacity(0.2)
        : Colors.blue.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLeft) _buildNumber(numberBgColor),
          if (isLeft) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                  textAlign: isLeft ? TextAlign.left : TextAlign.right,
                ),
              ],
            ),
          ),
          if (!isLeft) const SizedBox(width: 16),
          if (!isLeft) _buildNumber(numberBgColor),
        ],
      ),
    );
  }

  Widget _buildNumber(Color bgColor) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isDarkMode ? Colors.purple.shade200 : Colors.blue.shade700,
          ),
        ),
      ),
    );
  }
}