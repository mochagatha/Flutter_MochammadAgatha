import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_provider/view/validation_function.dart';
import 'package:intl/intl.dart';

import 'validation_function.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.contactList,
    required this.notifyParent,
    required this.nameInputController,
    required this.numberInputController,
    required this.colorGetter,
    required this.dateController,
    required this.fileGetter,
  });

  final List contactList;

  final Function colorGetter;

  final Function fileGetter;

  final TextEditingController nameInputController;

  final TextEditingController numberInputController;

  final TextEditingController dateController;

  final void Function() notifyParent;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _formkey = GlobalKey<FormState>();

  Color _pickedColor = Colors.blue;

  _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'png', 'gif', 'jpg']);

    if (result == null) return null;

    final file = result.files.first;

    debugPrint("file data : $file");

    return file.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              maxLines: 1,
              controller: widget.nameInputController,
              validator: (String? value) {
                return validatingName(value!);
              },
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF49454F),
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                hintText: 'Input Your Name',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLines: 1,
              controller: widget.numberInputController,
              validator: (String? value) {
                return validatingNumber(value!);
              },
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF49454F),
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                hintText: 'Input Your Phone Number',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Number',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              readOnly: true,
              controller: widget.dateController,
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime((DateTime.now().year + 5)),
                );

                if (selectedDate != null) {
                  widget.dateController.text =
                      DateFormat('dd-MM-yyyy').format(selectedDate);
                }
              },
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF49454F),
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                hintText: 'DD-MM-YYYY',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Date',
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pickedColor,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: _pickedColor,
                              onColorChanged: (color) {
                                widget.colorGetter(color);
                                setState(() {
                                  _pickedColor = color;
                                });
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Exit"),
                            ),
                          ],
                        );
                      });
                },
                child: const Text("Pick Color"),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pickedColor,
                ),
                onPressed: () async {
                  final file = await _pickFile();
                  widget.fileGetter(file);
                },
                child: const Text("Pick File"),
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  return widget.notifyParent();
                }
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF6750A4)),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}