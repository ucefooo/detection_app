import 'package:detection_app/boxes.dart';
import 'package:detection_app/main_layout.dart';
import 'package:detection_app/result.dart';
import 'package:detection_app/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

class SavedCaseResult extends StatefulWidget {
  final File imageFile;
  final String results;
  final String index;
  const SavedCaseResult(
      {super.key,
      required this.imageFile,
      required this.results,
      required this.index});

  @override
  State<SavedCaseResult> createState() => _SavedCaseResultState();
}

class _SavedCaseResultState extends State<SavedCaseResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: const Icon(
                        Icons.close_outlined,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: FileImage(widget.imageFile),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.9),
                          BlendMode.saturation,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            // color: Color(0xFF8FD3BE),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 205, 221, 216),
                                Color(0xFF00B57A)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              '${widget.results} of lechmaniasis',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Divider(color: Color(0xFF00B57A), thickness: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Results:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'After analysis it may be ${widget.results} of leishmaniasis.',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Note: Any results above 50% indicate a high probability of leishmaniasis detection and should be followed by a confirmatory test in a clinical setting.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 12.0, left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      CustomButton(
                        backgroundColor: const Color.fromARGB(255, 0, 159, 252),
                        text: 'Re-do test',
                        onPressed: () {
                          //implement the save to database functionality here

                          // Add re-do test functionality here
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const MainLayout(
                                    initialRoute:
                                        newCaseRoute)), // Replace NewPage with your target page
                            (Route<dynamic> route) =>
                                false, // This removes all the previous routes
                          );
                        },
                      ),
                      CustomButton(
                        backgroundColor: const Color(0xFF00B57A),
                        text: 'Share results',
                        onPressed: () async {
                          //implement the save to database functionality here

                          // Add finish test functionality here
                          if (widget.imageFile.existsSync()) {
                            await Share.shareXFiles(
                                [XFile(widget.imageFile.path)],
                                text:
                                    'Leishmaniasis test results are: ${widget.results}');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Error: Image could not be shared, please try again')),
                            );
                          }
                        },
                      ),
                      CustomButton(                        backgroundColor: Colors.red,

                        text: 'Unsave case',
                        onPressed: () async {
                          //implement the save to database functionality here
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Are you sure you want to unsave this test?",
                                  style: TextStyle(
                                      fontSize:
                                          16), // Adjust font size if needed
                                ),
                                content: const Text(
                                    'Do you want to unsaved the current test?'),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0.0),
                                          backgroundColor:
                                              const Color(0xFFFC5F5F),
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size(120, 40),
                                          maximumSize: const Size(120, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          'Cancel',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            var value =
                                                boxResult.get(widget.index);
                                            boxResult.delete(widget.index);
                                            boxResult.put(
                                                widget.index,
                                                Result(
                                                    imagePath: value?.imagePath,
                                                    results: value?.results,
                                                    date: value?.date,
                                                    saved: 0));
                                          });
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainLayout(
                                                        initialRoute:
                                                            unsavedCaseRoute)), // Replace NewPage with your target page
                                            (Route<dynamic> route) =>
                                                false, // This removes all the previous routes
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0.0),
                                          backgroundColor:
                                              const Color(0xFF00B57A),
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size(120, 40),
                                          maximumSize: const Size(120, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          'Unsave test',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(120, 40),
        maximumSize: const Size(120, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
