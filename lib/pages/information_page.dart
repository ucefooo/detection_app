import 'package:flutter/material.dart';
import 'package:detection_app/classes/language_constants.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).infromations,
          style: const TextStyle(
            color: Colors.white,
          ),
          ),
        backgroundColor: Color(0xFF00B57A),
      ),
    );
  }
}