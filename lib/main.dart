import 'package:flutter/material.dart';
import 'package:form_design_patterns/app.dart';
import 'package:form_design_patterns/utils/log/logger.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void main() {
  setupLocator().then((value) {
    runApp(MyApp());
  });
}

Future<void> setupLocator() async {
  locator.registerSingleton(Logger());
}