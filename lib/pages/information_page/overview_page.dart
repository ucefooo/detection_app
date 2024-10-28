import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shadowColor = isDarkMode ? Colors.purple.withOpacity(0.3) : Colors.blue.withOpacity(0.2);
    final headerGradientColors = isDarkMode 
      ? [Colors.purple.shade900, Colors.purple.shade800]
      : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Overview'),
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
                    'Leishmaniasis',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Parasitic Disease Overview',
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InfoSection(
                        title: 'What is Leishmaniasis?',
                        content: 'Leishmaniasis is a parasitic disease caused by the Leishmania parasite, transmitted to humans through the bites of infected sand flies. It primarily affects the skin, mucous membranes, and internal organs, causing a range of clinical manifestations.',
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  StatisticsCard(
                    title: 'Worldwide Statistics',
                    content: 'Leishmaniasis affects millions across 98 countries, mainly in tropical and subtropical regions. The WHO estimates that around 700,000 to 1 million new cases occur annually, with over 20,000 deaths.',
                    icon: Icons.public,
                    isDarkMode: isDarkMode,
                    shadowColor: shadowColor,
                  ),
                  const SizedBox(height: 24),
                  StatisticsCard(
                    title: 'Morocco Statistics',
                    content: 'In Morocco, cases of cutaneous leishmaniasis are more common, particularly in rural areas. The country has observed fluctuating cases, influenced by factors like climate, socio-economic status, and public health efforts.',
                    icon: Icons.location_on,
                    isDarkMode: isDarkMode,
                    shadowColor: shadowColor,
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

class InfoSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isDarkMode;

  const InfoSection({
    Key? key,
    required this.title,
    required this.content,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          content,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.white70 : Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final bool isDarkMode;
  final Color shadowColor;

  const StatisticsCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.isDarkMode,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isDarkMode ? Colors.purple : Colors.blue,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                color: isDarkMode ? Colors.white70 : Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}