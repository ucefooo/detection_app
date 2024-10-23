import 'package:detection_app/boxes.dart';
import 'package:detection_app/main_layout.dart';
import 'package:detection_app/result.dart';
import 'package:detection_app/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:detection_app/classes/language_constants.dart';

class UnsavedCaseResult extends StatefulWidget {
  final File imageFile;
  final String results;
  final String index;
  const UnsavedCaseResult(
      {super.key,
      required this.imageFile,
      required this.results,
      required this.index});

  @override
  State<UnsavedCaseResult> createState() => _UnsavedCaseResultState();
}

class _UnsavedCaseResultState extends State<UnsavedCaseResult> {
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
                        Icons.close,
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
                              '${widget.results} ${translation(context).newCaseResultOfLechmaniasis}',
                              style: const TextStyle(
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Divider(color: Color(0xFF00B57A), thickness: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation(context).newCaseResultResults,
                        // 'Results:',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${translation(context).newCaseResultAfterAnalysis} ${widget.results} ${translation(context).newCaseResultOfLechmaniasis}.',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    translation(context).newCaseResultNote,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
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
                        backgroundColor: Colors.red,
                        text: translation(context).newCaseResultRedoTest,
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
                        text: translation(context).newCaseResultSaveResults,
                        onPressed: () async {
                          //implement the save to database functionality here
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  translation(context).newCaseResultSaveTest,
                                  // "Are you sure you want to save this test?",
                                  style: const TextStyle(
                                      fontSize:
                                          16), // Adjust font size if needed
                                ),
                                content: Text(
                                  translation(context)
                                      .newCaseResultSaveTestContent,
                                ),
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
                                        child: Text(
                                          translation(context)
                                              .newCasePageCancelButton,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
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
                                                    saved: 1));
                                          });
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainLayout(
                                                        initialRoute:
                                                            savedCaseRoute)), // Replace NewPage with your target page
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
                                        child: Text(
                                          translation(context)
                                              .unsavedCaseResultSaveTest,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
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
        minimumSize: const Size(150, 40),
        maximumSize: const Size(150, 40),
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
