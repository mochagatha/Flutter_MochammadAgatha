// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class showImage extends StatefulWidget {
  const showImage({Key? key}) : super(key: key);

  @override
  State<showImage> createState() => _showImageState();
}

class _showImageState extends State<showImage> {
  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Show Image"),
          actions: const [],
        ),
        body: Center(
          child: Image.asset(
            parameter,
            fit: BoxFit.fill,
          ),
        ));
  }
}
