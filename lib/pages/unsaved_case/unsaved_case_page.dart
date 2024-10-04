import 'dart:io';
import 'package:detection_app/boxes.dart';
import 'package:detection_app/pages/unsaved_case/unsaved_case_result.dart';
import 'package:detection_app/pages/utils/date_fomat.dart';
import 'package:flutter/material.dart';

class UnsavedCasePage extends StatefulWidget {
  const UnsavedCasePage({super.key});

  @override
  State<UnsavedCasePage> createState() => _UnsavedCasePageState();
}

class _UnsavedCasePageState extends State<UnsavedCasePage> {
  var sortedEntries = boxResult
      .toMap()
      .entries
      .toList()
      .where((entry) => entry.value.saved == 0)
      .toList()
    ..sort((a, b) {
      var dateA = a.value.date ?? DateTime.now();
      var dateB = b.value.date ?? DateTime.now();
      return dateB.compareTo(dateA); // Sort in descending order (latest first)
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
            child: ListView(
              children: [
                sortedEntries.isEmpty
                    ? const Center(
                        child: Text(
                          'No unsaved cases',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          ...sortedEntries.map((entry) {
                            var result = entry.value;
                            String index = entry.key;
                            return PossibilityCard(
                              index: index,
                              imageUrl: result.imagePath,
                              possibility: result.results ?? 'N/A',
                              date: formatDate(result.date ?? DateTime.now()),
                            );
                          }),
                        ],
                        // const PossibilityCard(
                        //   index: 'ff',
                        //   imageUrl: '/storage/emulated/0/Download/photo_1727103662981.jpg',
                        //   possibility: '8% possibilty',
                        //   date: '25/02/2024,12:23AM',
                        // ),
                      )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Note: Only the most recent 20 cases are stored here. Please save any important cases to avoid data loss.',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class PossibilityCard extends StatelessWidget {
  final String? imageUrl;
  final String possibility;
  final String date;
  final String index;

  const PossibilityCard({
    super.key,
    required this.index,
    this.imageUrl,
    required this.possibility,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.teal[800] : Colors.teal[50];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => UnsavedCaseResult(
              imageFile: File(imageUrl!),
              results: possibility,
              index: index,
            ),
          ))
        },
        child: Container(
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 100),
          decoration: BoxDecoration(
            color: textColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(imageUrl!),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error_outline),
                          ),
                        )
                      : null,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      possibility,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xFF00B57A),
                  size: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
