import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

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
        title: Text(translation(context).prevention),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translation(context).transmissioncyclestep78,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  translation(context).transmissioncyclestep79,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                PreventionCard(
                  title: translation(context).transmissioncyclestep80,
                  description: translation(context).transmissioncyclestep81,
                  imagePath: 'assets/diagnosis.png',
                ),
                const SizedBox(height: 12),
                PreventionCard(
                  title: translation(context).transmissioncyclestep82,
                  description: translation(context).transmissioncyclestep83,
                  imagePath: 'assets/surveillance.png',
                ),
                const SizedBox(height: 12),
                PreventionCard(
                  title: translation(context).transmissioncyclestep84,
                  description: translation(context).transmissioncyclestep85,
                  imagePath: 'assets/social.png',
                ),
                const SizedBox(height: 12),
                PreventionCard(
                  title: translation(context).transmissioncyclestep86,
                  description: translation(context).transmissioncyclestep87,
                  imagePath: 'assets/animal.png',
                ),
                const SizedBox(height: 12),
                PreventionCard(
                  title: translation(context).transmissioncyclestep88,
                  description: translation(context).transmissioncyclestep89,
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
              context: context,
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
  final BuildContext context;

  const PreventionDetailsSheet({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.context,
  });

  String getDetailedDescription() {
    final translatedStep80 = translation(context).transmissioncyclestep80;
    final translatedStep82 = translation(context).transmissioncyclestep82;
    final translatedStep84 = translation(context).transmissioncyclestep84;
    final translatedStep86 = translation(context).transmissioncyclestep86;
    final translatedStep88 = translation(context).transmissioncyclestep88;

    if (title == translatedStep80) {
      return translation(context).transmissioncyclestep90;
    } else if (title == translatedStep82) {
      return translation(context).transmissioncyclestep91;
    } else if (title == translatedStep84) {
      return translation(context).transmissioncyclestep92;
    } else if (title == translatedStep86) {
      return translation(context).transmissioncyclestep93;
    } else if (title == translatedStep88) {
      return translation(context).transmissioncyclestep94;
    } else {
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