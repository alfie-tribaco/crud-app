import 'package:flutter/material.dart';
import 'package:mantact/app/utils/shared/screens/custom_unknown_screen.dart';
import 'package:mantact/features/contact_module/views/screens/contact_screen.dart';
import 'package:mantact/features/settings_module/views/screens/settings_screen.dart';

class AppRoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const CustomUnknownScreen());
    }
  }
}
