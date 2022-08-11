import 'package:flutter/material.dart';
import 'package:wallet/button_navigator.dart';

void main() => {runApp(const MyApp())};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonNavigator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
