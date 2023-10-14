import 'package:flutter/material.dart';
import 'package:open_ai/view/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class RekomendasiHp extends StatefulWidget {
  const RekomendasiHp({Key? key}) : super(key: key);

  @override
  State<RekomendasiHp> createState() => _RekomendasiHpState();
}

class _RekomendasiHpState extends State<RekomendasiHp> {
  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<HandphoneViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Recommendations"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: modelview.budget,
                      keyboardType: TextInputType.phone,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Budget',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "Berapa Budget kamu?",
                      ),
                    ),
                    TextFormField(
                      controller: modelview.camera,
                      keyboardType: TextInputType.phone,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Camera (MP)',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText:
                            "Berapa mega pixel kamera yang kamu inginkan?",
                      ),
                    ),
                    TextFormField(
                      controller: modelview.storage,
                      keyboardType: TextInputType.phone,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Internal Storage',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText:
                            "Berapa internal storage yang kamu inginkan?",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  modelview.makeApiRequest(context);
                },
                child: const Text("GET RECOMMENDATIONS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
