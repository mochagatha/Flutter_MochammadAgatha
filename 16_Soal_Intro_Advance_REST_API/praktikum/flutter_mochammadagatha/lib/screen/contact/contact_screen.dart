// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        title: const Text("Prioritas 1"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: modelview.name,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "What's your name?",
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: modelview.job,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Job',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "What's your job?",
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          modelview.addData(
                            name: modelview.name.text,
                            job: modelview.job.text,
                          );
                        },
                        child: const Text('Submit')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Consumer<ContactViewModel>(
                builder: (context, contactViewModel, child) {
                  return Column(
                    children: [
                      const Text(
                        'Response Data:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      contactViewModel.responseData.id != null
                          ? Text('ID: ${contactViewModel.responseData.id}')
                          : const Text('ID:'),
                      contactViewModel.responseData.name != null
                          ? Text('Name: ${contactViewModel.responseData.name}')
                          : const Text('Name:'),
                      contactViewModel.responseData.job != null
                          ? Text('Job: ${contactViewModel.responseData.job}')
                          : const Text('Job:'),
                      contactViewModel.responseData.createdAt != null
                          ? Text(
                              'CreatedAt: ${contactViewModel.responseData.createdAt}')
                          : const Text('CreatedAt:'),
                          
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
