import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/view/gridview_screen.dart';
import 'package:flutter_mochammadagatha/view/show_image.dart';
import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const gridviewScreen(),
        '/showImage': (_) => const showImage(),
        '/contacts': (_) => const createNewContacts(),
      },
    );
  }
}
