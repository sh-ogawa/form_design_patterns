import 'package:flutter/material.dart';

/// TextFieldを生成する
var createTextField = ({
  @required String label,
  @required Stream stream,
  @required Function changed,
  bool obscureText = false,
  keyboardType = TextInputType.text,
}) => Column(
  children: <Widget>[
    Text(label),
    StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          enabled: true,
          keyboardType: keyboardType,
          maxLines: 1,
          maxLength: 20,
          obscureText: obscureText,
          onChanged: changed,
          textAlign: TextAlign.center,
        );
      },
    ),
  ],
);