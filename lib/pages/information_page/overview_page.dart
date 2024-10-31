import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

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
        title: Text(translation(context).overview),
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
                    translation(context).leishmaniasis,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translation(context).parasitic_disease_overview,
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
                        title: translation(context).what_is_leishmaniasis,
                        content: translation(context).leishmaniasis_description,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  StatisticsCard(
                    title: translation(context).worldwide_statistics,
                    content: translation(context).worldwide_statistics_description,
                    icon: Icons.public,
                    isDarkMode: isDarkMode,
                    shadowColor: shadowColor,
                  ),
                  const SizedBox(height: 24),
                  StatisticsCard(
                    title: translation(context).morocco_statistics,
                    content: translation(context).morocco_statistics_description,
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