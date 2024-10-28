import 'package:detection_app/pages/information_page/clinical_page.dart';
import 'package:detection_app/pages/information_page/diagnostic_page.dart';
import 'package:detection_app/pages/information_page/overview_page.dart';
import 'package:detection_app/pages/information_page/prevention_control_page.dart';
import 'package:detection_app/pages/information_page/trasmission_page.dart';
import 'package:detection_app/pages/information_page/treatment_page.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          SymptomCard(
            title: 'Overview of Leishmaniasis',
            iconColor: Colors.blue.shade600, // Matches header color scheme
            icon: Icons.info_outline, // Information icon fits overview content
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const OverviewPage()),
            ),
          ),
          SymptomCard(
            title: 'Transmission cycle',
            iconColor:
                Colors.orange.shade600, // Warning/alert color for transmission
            icon: Icons.bug_report, // Bug icon represents vector transmission
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const TransmissionPage()),
            ),
          ),
          SymptomCard(
            title: 'Clinical forms',
            iconColor: Colors.red.shade600, // Medical/emergency color
            icon: Icons.local_hospital, // Hospital icon for clinical aspects
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const ClinicalPage()),
            ),
          ),
          SymptomCard(
            title: 'Diagnostic techniques',
            iconColor: Colors
                .purple.shade800, // Matches diagnostic page header dark mode
            icon: Icons.science, // Science icon for diagnostic/lab work
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const DiagnosticPage()),
            ),
          ),
          SymptomCard(
            title: 'Treatment',
            iconColor: Colors.green.shade600, // Healing/positive color
            icon: Icons.medication, // Medication icon for treatment
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => const TreatmentPage()),
            ),
          ),
          SymptomCard(
            title: 'Prevention and control strategies',
            iconColor: Colors.blue.shade800, // Matches prevention page header
            icon: Icons.shield, // Shield icon represents protection/prevention
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                  builder: (context) => const PreventionControlPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String title;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const SymptomCard({
    super.key,
    required this.title,
    required this.iconColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Detail page for $title',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
