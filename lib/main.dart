import 'package:flutter/material.dart';
import 'package:recollar_frontend/configuration.dart';
import 'package:recollar_frontend/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'RecollAR',
      theme: ThemeData(
        textSelectionTheme:  TextSelectionThemeData(
          selectionHandleColor: color1,
          cursorColor: color1,
        ),
      ),
      home: Login(),
    );
  }
}
