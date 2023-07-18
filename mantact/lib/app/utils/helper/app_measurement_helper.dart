import 'package:flutter/material.dart';

class AppMeasurementHelper {
  static double calculateMeasurement(context, value, type) {
    if (type == 'height') {
      return MediaQuery.of(context).size.height * value;
    } else {
      return MediaQuery.of(context).size.width * value;
    }
  }
}
