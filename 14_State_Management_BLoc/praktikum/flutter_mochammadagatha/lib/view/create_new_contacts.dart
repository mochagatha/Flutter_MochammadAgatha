import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/contact_list_bloc.dart';
import '../model/contact_model.dart';

class CreateNewContacts extends StatefulWidget {
  const CreateNewContacts({Key? key}) : super(key: key);

  @override
  State<CreateNewContacts> createState() => _CreateNewContactsState();
}

class _CreateNewContactsState extends State<CreateNewContacts> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  String editedName = '';
  String editedNomor = '';
  // bool isEditing = false;
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
                textFieldUser(),
                const SizedBox(height: 5),
                // buildDatePicker(context),
                const SizedBox(height: 15),
                // buildColorPicker(context),
                const SizedBox(height: 5),
                // buildFilePicker(context),
                const SizedBox(height: 5),
                button(),
                const SizedBox(height: 40),
                Text(
                  "List Contacts",
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                listContact()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldUser() {
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

  Widget button() {
    final contactBloc = context.read<ContactListBloc>();
    return BlocConsumer<ContactListBloc, ContactListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: contactBloc.isEditing
                    ? Colors.green
                    : const Color(0xFF6750A4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String name = nameController.text;
                  String nomor = nomorController.text;

                  if (contactBloc.isEditing) {
                    // Edit data Nama & Nomor
                    int itemIndex = state.contactList.indexWhere((item) =>
                        item.name == editedName && item.number == editedNomor);

                    ContactModel contact = ContactModel(
                      name: name,
                      number: nomor,
                    );

                    context
                        .read<ContactListBloc>()
                        .add(ChangeContactEvent(contact, itemIndex));
                    contactBloc.isEditing = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Berhasil Diedit"),
                      ),
                    );
                  } else {
                    final newContact = ContactModel(
                      name: name,
                      number: nomor,
                    );
                    contactBloc.add(AddContactEvent(newContact));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Contacts Berhasil Ditambahkan"),
                      ),
                    );
                  }
                  editedName = '';
                  editedNomor = '';
                  nameController.clear();
                  nomorController.clear();
                  selectedFileName = "Pick Your File";
                  filePath = null;
                }
              },
              child: Text(contactBloc.isEditing ? "Simpan" : "Submit"),
            ),
            const SizedBox(width: 5),
            if (contactBloc.isEditing)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  //  contactBloc.add(CancelEditEvent());
                  context.read<ContactListBloc>().add(CancelEditEvent());
                  editedName = '';
                  editedNomor = '';
                  nameController.clear();
                  nomorController.clear();
                  selectedFileName = "Pick Your File";
                  filePath = null;
                },
                child: const Text("Batal"),
              ),
          ],
        );
      },
    );
  }

  Widget listContact() {
    final contactBloc = context.read<ContactListBloc>();
    return BlocConsumer<ContactListBloc, ContactListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            for (int index = 0;
                index < contactBloc.state.contactList.length;
                index++)
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
                              contactBloc.state.contactList[index].name[0],
                              style: const TextStyle(
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
                              _truncateText(
                                  contactBloc.state.contactList[index].name,
                                  20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(contactBloc.state.contactList[index].number),
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
                              editedName =
                                  contactBloc.state.contactList[index].name;
                              editedNomor =
                                  contactBloc.state.contactList[index].number;
                              nameController.text = editedName;
                              nomorController.text = editedNomor;
                              contactBloc.isEditing = true;
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
                                        contactBloc.add(
                                          DeleteContactEvent(index),
                                        );
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
      },
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
