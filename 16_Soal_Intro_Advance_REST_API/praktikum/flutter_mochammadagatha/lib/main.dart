import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/view/nav_bottom.dart';
import 'screen/view_model/contact_view_model.dart';

void main() {
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
}
