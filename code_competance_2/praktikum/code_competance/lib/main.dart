// import 'package:code_competance/home_page.dart';
// import 'package:code_competance/view/screen/about.dart';
import 'package:code_competance/view/screen/home_page.dart';
import 'package:code_competance/view/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeViewModel())
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}