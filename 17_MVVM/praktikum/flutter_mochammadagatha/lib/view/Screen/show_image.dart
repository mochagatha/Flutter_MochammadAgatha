

import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
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
