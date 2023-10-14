import 'package:flutter/material.dart';

class HasilGenerate extends StatelessWidget {
  final Map<String, dynamic> responseData;

  const HasilGenerate({Key? key, required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> choices = responseData['choices'];
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Generate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: choices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(choices[index]['text'], textAlign: TextAlign.justify),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

