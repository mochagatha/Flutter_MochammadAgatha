// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'contact_view_model.dart';

class Prioritas2 extends StatelessWidget {
  const Prioritas2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<ContactViewModel>(context, listen: false);
    modelview.getImage();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prioritas 2"),
        actions: const [],
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, contactViewModel, child) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SvgPicture.network(
                   contactViewModel.getGambar,
                    width: 200,
                    height: 200,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
