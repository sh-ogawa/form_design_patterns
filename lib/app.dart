import 'package:flutter/material.dart';
import 'package:form_design_patterns/main.dart';
import 'package:form_design_patterns/pages/login/main.dart';
import 'package:form_design_patterns/theme/theme.dart';
import 'package:form_design_patterns/utils/log/logger.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    locator<Logger>().log('I0100001');

    return MaterialApp(
      builder: (context, child) {
        return Theme(
          data: AppTheme.theme(context),
          child: child,
        );
      },
      title: '入力フォームのカタログ',
      home: LoginMainPage(),
    );
  }
}