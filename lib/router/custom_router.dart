import 'package:detection_app/pages/new_case/new_case_camera_first.dart';
import 'package:flutter/material.dart';
import 'package:detection_app/pages/about_page.dart';
import 'package:detection_app/pages/help_page/help_page.dart';
import 'package:detection_app/pages/home_page/home_page.dart';
import 'package:detection_app/pages/how_to_use_page/how_to_use_page.dart';
import 'package:detection_app/pages/information_page.dart';
import 'package:detection_app/pages/new_case/new_case_page.dart';
import 'package:detection_app/pages/not_found_page.dart';
import 'package:detection_app/pages/saved_case/saved_case_page.dart';
import 'package:detection_app/pages/settings_page/settings_page.dart';
import 'package:detection_app/pages/unsaved_case/unsaved_case_page.dart';
import 'package:detection_app/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case newCaseRoute:
        return MaterialPageRoute(builder: (_) => const NewCasePage());
      case savedCaseRoute:
        return MaterialPageRoute(builder: (_) => const SavedCasePage());
      case unsavedCaseRoute:
        return MaterialPageRoute(builder: (_) => const UnsavedCasePage());
      case informationRoute:
        return MaterialPageRoute(builder: (_) => const InformationPage());
      case howToUseRoute:
        return MaterialPageRoute(builder: (_) => const HowToUsePage());
      case helpRoute:
        return MaterialPageRoute(builder: (_) => const HelpPage());

      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());

      case 'case2':
        return MaterialPageRoute(builder: (_) => const CameraPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
