import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../view_model/contact_view_model.dart';

class GenerateFoto extends StatefulWidget {
  const GenerateFoto({Key? key}) : super(key: key);

  @override
  State<GenerateFoto> createState() => _GenerateFotoState();
}

class _GenerateFotoState extends State<GenerateFoto> {
  late ContactViewModel modelview;
  @override
  void initState() {
    modelview = Provider.of<ContactViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ekplorasi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Consumer<ContactViewModel>(
                builder: (context, contactViewModel, child) {
                  return SvgPicture.network(
                    modelview.hasilGenerateGambar,
                    width: 200,
                    height: 200,
                  );
                },
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: modelview.initial,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Generate Foto',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  modelview.generateInitial(initial: modelview.initial.text);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
