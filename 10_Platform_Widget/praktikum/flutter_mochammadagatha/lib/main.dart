import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/eksplorasi/eksplorasi.dart';
import 'package:flutter_mochammadagatha/prioritas1/material_page.dart';
import 'package:flutter_mochammadagatha/prioritas2/cupertio_page.dart';

void main() {
  runApp(
      const AppMaterial()
      // const AppCupertino()
      // const AppEksplorasi()
      );
}

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppCupertino extends StatelessWidget {
  const AppCupertino({super.key});
  
  final _themeDart = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDart,
      home: const homeCupertino(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppEksplorasi extends StatelessWidget {
  const AppEksplorasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const eksplorasi(),
      debugShowCheckedModeBanner: false,
    );
  }
}