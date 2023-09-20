import 'package:flutter/material.dart';
import 'package:flutter_tugas12/screens/gridview_screen.dart';
import 'package:flutter_tugas12/screens/show_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const gridviewScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => const gridviewScreen(),
        '/showImage': (_) => const showImage()
      },
    );
  }
}

