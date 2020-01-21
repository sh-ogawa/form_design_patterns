import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width <= 600) {
      return _default();
    }
    return _large();
  }

  static ThemeData _default() {
    return ThemeData(
      textTheme: TextTheme()
    );
  }

  static ThemeData _large() {
    return ThemeData();
  }

}