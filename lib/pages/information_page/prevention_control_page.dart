import 'package:flutter/material.dart';

class PreventionControlPage extends StatelessWidget {
  const PreventionControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerGradientColors = isDarkMode 
        ? [Colors.purple.shade900, Colors.purple.shade800]
        : [Colors.blue.shade600, Colors.blue.shade500];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prevention & Control'),
        elevation: 0,
      ),
      body: Column(
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
                  'Prevention & Control',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Key strategies for Leishmaniasis control:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                PreventionCard(
                  title: 'Early diagnosis & safe medicine',
                  description: 'Access to safe medicine and timely diagnosis',
                  imagePath: 'assets/diagnosis.png',
                ),
                SizedBox(height: 12),
                PreventionCard(
                  title: 'Effective disease surveillance',
                  description: 'Monitoring and tracking systems',
                  imagePath: 'assets/surveillance.png',
                ),
                SizedBox(height: 12),
                PreventionCard(
                  title: 'Social mobilization',
                  description: 'Strengthening partnerships',
                  imagePath: 'assets/social.png',
                ),
                SizedBox(height: 12),
                PreventionCard(
                  title: 'Control of animal reservoir hosts',
                  description: 'Management of animal populations',
                  imagePath: 'assets/animal.png',
                ),
                SizedBox(height: 12),
                PreventionCard(
                  title: 'Vector control',
                  description: 'Sandfly population management',
                  imagePath: 'assets/vector.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PreventionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => PreventionDetailsSheet(
              title: title,
              description: description,
              imagePath: imagePath,
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class PreventionDetailsSheet extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PreventionDetailsSheet({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  String getDetailedDescription() {
    switch (title) {
      case 'Early diagnosis & safe medicine':
        return '• Rapid diagnostic testing\n• Access to medical facilities\n• Trained healthcare workers\n• Quality medication availability\n• Regular follow-up care';
      case 'Effective disease surveillance':
        return '• Case reporting systems\n• Data collection and analysis\n• Outbreak monitoring\n• Geographic mapping\n• Risk assessment';
      case 'Social mobilization':
        return '• Community education programs\n• Local health partnerships\n• Public awareness campaigns\n• Stakeholder engagement\n• Resource mobilization';
      case 'Control of animal reservoir hosts':
        return '• Host population monitoring\n• Vaccination programs\n• Population control measures\n• Habitat management\n• Regular screening';
      case 'Vector control':
        return '• Insecticide spraying\n• Bed net distribution\n• Environmental management\n• Breeding site elimination\n• Resistance monitoring';
      default:
        return description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            getDetailedDescription(),
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}