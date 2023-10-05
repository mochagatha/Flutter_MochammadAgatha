import 'package:flutter/material.dart';
// import 'package:flutter_mochammadagatha/screen/contact/contact_screen.dart';
import 'package:flutter_mochammadagatha/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

import 'screen/contact/nav_bottom.dart';

void main() {
  // runApp(const MyApp());
    runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ContactViewModel())
  ],
  child: const MyApp(),
  ));
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
      home: const BottomNavScreen(),
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     theme: ThemeData(
  //       brightness: Brightness.light,
  //     ),
  //     debugShowCheckedModeBanner: false,
  //     routes: {
  //       '/': (_) => const ContactScreen(),
  //       // '/showImage': (_) => const showImage(),
  //       // '/contacts': (_) => const GridviewScreen(),
  //     },
  //   );
  // }
}
