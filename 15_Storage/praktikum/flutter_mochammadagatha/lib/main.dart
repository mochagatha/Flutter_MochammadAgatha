import 'package:flutter/material.dart';
// import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';
import 'package:flutter_mochammadagatha/view/login.dart';

void main() {
  runApp(
      const MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}