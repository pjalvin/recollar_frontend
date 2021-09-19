import 'package:flutter/material.dart';
import 'package:recollar_frontend/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RecollAR',
      home: Login(),
    );
  }
}
