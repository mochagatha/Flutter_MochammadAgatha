// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, non_constant_identifier_names, depend_on_referenced_packages, unnecessary_null_comparison, avoid_types_as_parameter_names, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class createNewContacts extends StatefulWidget {
  const createNewContacts({Key? key}) : super(key: key);

  @override
  State<createNewContacts> createState() => _createNewContactsState();
}

class _createNewContactsState extends State<createNewContacts> {
  List<List<dynamic>> dataList = [
    // ['Leanne Graham', 'L', '0895397133255']
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  String editedName = '';
  String editedNomor = '';
  bool isEditing = false;
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color(0xFF6750A4);
  String selectedFileName = "Pick Your File";
  String? filePath;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }
    List<String> words = value.split(' ');
    bool isValid = true;

    for (String word in words) {
      if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
        isValid = false;
        return 'Nama boleh tidak mengandung angka atau karakter khusus.';
      }
    }
    if (words.length < 2 || !isValid) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }

    return null;
  }

  String? validateNomor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor wajib diisi';
    }

    if (value.length < 8) {
      return 'Nomor harus terdiri dari minimal 8 angka';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Nomor hanya boleh angka';
    }
    if (!value.startsWith('0')) {
      return 'Nomor harus diawali 0';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.mobile_friendly,
                        size: 24.0,
                      ),
                      Text(
                        "Create New Contacts",
                        style: GoogleFonts.roboto(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                          "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. "),
                      const Divider(thickness: 1),
                    ],
                  ),
                ),
                TextFieldUser(),
                const SizedBox(height: 5),
                buildDatePicker(context),
                const SizedBox(height: 15),
                buildColorPicker(context),
                const SizedBox(height: 5),
                BuildFilePicker(context),
                const SizedBox(height: 5),
                Button(),
                const SizedBox(height: 40),
                Text(
                  "List Contacts",
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                ListContact()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TextFieldUser() {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Insert Your Name',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                filled: true,
                fillColor: Color(0xFFE7E0EC),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: validateName,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                TextFormField(
                    controller: nomorController,
                    keyboardType: TextInputType.phone,
                    maxLength: 15,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Nomor',
                      hintText: '+62...',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFE7E0EC),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onChanged: (value) {},
                    validator: validateNomor),
              ],
            )
          ],
        ));
  }

  Widget Button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isEditing ? Colors.green : const Color(0xFF6750A4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            setState(() {
              if (formKey.currentState!.validate()) {
                String name = nameController.text;
                String nomor = nomorController.text;
                String date = DateFormat('EEEE-MM-yyyy').format(_dueDate);
                String color = _currentColor.value.toRadixString(16);
                String file = selectedFileName;

                //Mode edit data Nama & Nomor
                if (isEditing) {
                  // mencari indeks yang akan diedit
                  int itemIndex = dataList.indexWhere((item) =>
                      item[0] == editedName && item[2] == editedNomor);

                  // Memeriksa apakah index yang akan di edit di temukan
                  if (itemIndex >= 0) {
                    dataList[itemIndex][0] = name;
                    dataList[itemIndex][2] = nomor;

                    // Memperbarui huruf pertama pada kata pertama
                    String firstLetter = name.isNotEmpty ? name[0] : '';
                    dataList[itemIndex][1] = firstLetter.toUpperCase();

                    // Keluar dari mode edit
                    isEditing = false;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil Diedit"),
                    ),
                  );
                } else {
                  // Mode Tambah data
                  String firstLetter = name.isNotEmpty ? name[0] : '';
                  dataList.add([
                    name,
                    firstLetter.toUpperCase(),
                    nomor,
                    date,
                    color,
                    file
                  ]);

                  // Menggabungkan data dari dataList menjadi map
                  List<Map<String, dynamic>> newDataList = dataList.map((data) {
                    return {
                      'title': data[0],
                      'subtitle': data[2],
                      'date': data[3],
                      'color': data[4],
                      'file': data[5],
                    };
                  }).toList();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Contacts Berhasil Ditambahkan"),
                    ),
                  );
                  print(newDataList);
                }
                // Bersihkan textfield nama & nomor
                editedName = '';
                editedNomor = '';
                nameController.clear();
                nomorController.clear();
              }
            });
          },
          child: Text(isEditing ? "Simpan" : "Submit"),
        ),
        const SizedBox(width: 5),

        // Batal edit
        if (isEditing)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.red, // Atur warna latar belakang sesuai keinginan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () {
              setState(() {
                // Keluar dari mode edit dengan menghapus nama & nomor
                isEditing = false;
                editedName = '';
                editedNomor = '';
                nameController.clear();
                nomorController.clear();
              });
            },
            child: const Text("Batal"),
          ),
      ],
    );
  }

  Widget ListContact() {
    return Column(
      children: [
        for (var data in dataList)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.green,
                      child: Center(
                        child: Text(
                          "${data[1]}",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_truncateText(data[0], 20)}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text("${data[2]}"),
                        Text("Date: ${data[3]}"),
                        Row(
                          children: [
                            const Text("Color: "),
                            Container(
                              color: Color(int.parse("0x${data[4]}")),
                              width: 15,
                              height: 15,
                            )
                          ],
                        ),
                        Text(
                          "File Name: ${_truncateText(data[5], 20)}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Edit name & Nomor
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editedName = data[0];
                          editedNomor = data[2];
                          nameController.text = editedName;
                          nomorController.text = editedNomor;
                          isEditing = true;
                        });
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 24.0,
                      ),
                    ),

                    // Hapus name & Nomor
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Hapus Kontak"),
                              content: const Text(
                                  "Apakah Anda yakin ingin menghapus kontak ini?"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Tidak"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                //Membuat notif konfirmasi apakah jadi melakukan hapus data
                                TextButton(
                                  child: const Text("Ya"),
                                  onPressed: () {
                                    // Mengambil indeks item yang sesuai dengan button delete yang diklik
                                    int itemIndex = dataList.indexWhere(
                                        (item) =>
                                            item[0] == data[0] &&
                                            item[1] == data[1] &&
                                            item[2] == data[2]);
                                    // Hapus item dari dataList
                                    if (itemIndex >= 0) {
                                      setState(() {
                                        dataList.removeAt(itemIndex);
                                      });
                                    }
                                    // Tutup Konfirmasi Hapus
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 24.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

// Membuat Fungsi membatasi panjang sebuah text
  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }

// Mengambil Data tanggal
  Widget buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Date"),
              TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                    }
                  });
                },
                child: const Text("Select"),
              ),
            ],
          ),
          Text(DateFormat('EEEE-MM-yyyy').format(_dueDate)),
        ],
      ),
    );
  }

// Memilih Warna
  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color"),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_currentColor)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Pick your color"),
                      content: BlockPicker(
                        pickerColor: _currentColor,
                        onColorChanged: (Color) {
                          setState(() {
                            _currentColor = Color;
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        )
                      ],
                    );
                  });
            },
            child: const Text("Pick Color"),
          ),
        )
      ],
    );
  }

// MengambilFile di direktori
  Widget BuildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick File"),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: Text(selectedFileName),
          ),
        ),
        if (filePath != null)
          Center(
            child: ElevatedButton(
              onPressed: () {
                _openFile(filePath!);
              },
              child: const Text("Open File"),
            ),
          ),
      ],
    );
  }

// Menampilkan nama file di button
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFileName = file.name;
      filePath = file.path!;
    });
  }

  void _openFile(String filePath) {
    OpenFile.open(filePath);
  }
}
