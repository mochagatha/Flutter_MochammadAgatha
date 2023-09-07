// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, non_constant_identifier_names, depend_on_referenced_packages, unnecessary_null_comparison

import 'package:flutter/material.dart';
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
  String selectedFileName = "Pick your File";
  String? filePath;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'Insert your name',
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
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: nomorController,
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
        ),
      ],
    );
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
              String name = nameController.text;
              String nomor = nomorController.text;
              String date = DateFormat('dd-MM-yyyy').format(_dueDate);
              String color = _currentColor.value.toRadixString(16);
              String file = selectedFileName;

              List<String> words = name.split(' ');
              bool isValid = true;
              for (String word in words) {
                if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
                  isValid = false;
                  break;
                }
              }

              if (words.length != 2 || !isValid) {
                // Menampilkan pesan kesalahan jika nama tidak sesuai
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Nama harus terdiri dari dua kata dan Setiap kata harus dimulai dengan huruf kapital."),
                  ),
                );
                return;
              }

              RegExp regex = RegExp(r'[0-9!$]');
              if (regex.hasMatch(name)) {
                // Jika nama mengandung angka atau karakter khusus, tampilkan Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Nama tidak boleh mengandung angka atau karakter khusus"),
                  ),
                );
                return;
              }

              RegExp nomorRegex = RegExp(r'^\d{8,15}$');
              if (!nomorRegex.hasMatch(nomor)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Nomor harus berupa angka dan terdiri dari 8 hingga 15 angka."),
                  ),
                );
                return;
              }
              if (!nomor.startsWith('0')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Nomor harus diawali dengan '0'")),
                );
                return;
              }
              if (isEditing) {
                // Jika dalam mode edit, perbarui item yang sedang diedit
                int itemIndex = dataList.indexWhere(
                    (item) => item[0] == editedName && item[2] == editedNomor);

                if (itemIndex >= 0) {
                  dataList[itemIndex][0] = name;
                  dataList[itemIndex][2] = nomor;

                  // Perbarui huruf pertama dari kata pertama di dataList
                  String firstLetter = name.isNotEmpty ? name[0] : '';
                  dataList[itemIndex][1] =
                      firstLetter.toUpperCase(); // Perbarui huruf pertama

                  isEditing = false; // Keluar dari mode edit
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Berhasil Diedit"),
                  ),
                );
              } else {
                // Jika dalam mode tambah data baru, tambahkan item baru
                String firstLetter = name.isNotEmpty ? name[0] : '';
                dataList.add([
                  name,
                  firstLetter.toUpperCase(),
                  nomor,
                  date,
                  color,
                  file
                ]);

                // Menggabungkan semua data dari dataList menjadi list of maps
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
              // Bersihkan nilai yang diedit
              editedName = '';
              editedNomor = '';
              nameController.clear();
              nomorController.clear();
            });
          },
          child: Text(isEditing ? "Simpan" : "Submit"),
        ),
        const SizedBox(width: 5),
        if (isEditing) // Tampilkan tombol "Batal Edit" jika sedang dalam mode edit
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
                // Keluar dari mode edit tanpa menyimpan perubahan
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          editedName = data[0];
                          editedNomor = data[2];
                          nameController.text = editedName;
                          nomorController.text = editedNomor;
                          isEditing = true; // Masuk ke mode edit
                        });
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 24.0,
                      ),
                    ),
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
                                TextButton(
                                  child: const Text("Ya"),
                                  onPressed: () {
                                    // Mengambil indeks item yang sesuai dengan tombol delete yang diklik
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
                                    Navigator.of(context)
                                        .pop(); // Tutup dialog konfirmasi
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

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }

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
          Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
        ],
      ),
    );
  }

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
