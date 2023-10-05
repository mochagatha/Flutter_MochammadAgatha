import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mochammadagatha/view/ViewModel/view_model_contact.dart'
    as contact_store;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../../model/model.dart';
import '../ViewModel/view_model_contact.dart';

class CreateNewContacts extends StatefulWidget {
  const CreateNewContacts({Key? key}) : super(key: key);

  @override
  State<CreateNewContacts> createState() => _CreateNewContactsState();
}

class _CreateNewContactsState extends State<CreateNewContacts> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ContactProvider contactProvider;

  @override
  void initState() {
    contactProvider =
        Provider.of<contact_store.ContactProvider>(context, listen: false);
    super.initState();
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
                buildDatePicker(context),
                const SizedBox(height: 15),
                buildColorPicker(context),
                const SizedBox(height: 5),
                buildFilePicker(context),
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
              controller: contactProvider.nameController,
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
              validator: (value) => contactProvider.validateName(value),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                TextFormField(
                    controller: contactProvider.nomorController,
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
                    validator: (value) => contactProvider.validateNomor(value)),
              ],
            )
          ],
        ));
  }

  Widget button() {
    return Consumer<contact_store.ContactProvider>(
      builder: (context, contactProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: contactProvider.isEditing
                    ? Colors.green
                    : const Color(0xFF6750A4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  //Mode edit data Nama & Nomor
                  if (contactProvider.isEditing) {
                    GetContact editedContact =
                        contactProvider.contacts.firstWhere(
                      (contact) =>
                          contact.name == contactProvider.editedName &&
                          contact.nomor == contactProvider.editedNomor,
                    );
                    contactProvider.editContact(
                      editedContact,
                      contactProvider.nameController.text,
                      contactProvider.nomorController.text,
                      DateFormat('EEEE-dd-MM-yyyy')
                          .format(contactProvider.dueDate),
                      colorToHex(contactProvider.currentColor),
                      contactProvider.selectedFileName,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data Berhasil Diubah"),
                      ),
                    );
                  } else {
                    // Mode Tambah data
                    contactProvider.add(GetContact(
                      name: contactProvider.nameController.text,
                      nomor: contactProvider.nomorController.text,
                      date: DateFormat('EEEE-dd-MM-yyyy')
                          .format(contactProvider.dueDate),
                      color: colorToHex(contactProvider.currentColor),
                      file: contactProvider.selectedFileName,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Contacts Berhasil Ditambahkan"),
                      ),
                    );
                  }
                }
              },
              child: Text(contactProvider.isEditing ? "Simpan" : "Submit"),
            ),
            const SizedBox(width: 5),
            Visibility(
              visible: contactProvider.isEditing,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  contactProvider.cancelEdit();
                },
                child: const Text("Batal"),
              ),
            )
          ],
        );
      },
    );
  }

  Widget listContact() {
    return Consumer<contact_store.ContactProvider>(
      builder: (context, contactProvider, child) {
        return Column(
          children: [
            for (var data in contactProvider.contacts)
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
                              data.name[0],
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
                              _truncateText(data.name, 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(data.nomor),
                            Text("Date: ${data.date}"),
                            Row(
                              children: [
                                const Text("Color: "),
                                Container(
                                  color: Color(int.parse("0x${data.color}")),
                                  width: 15,
                                  height: 15,
                                )
                              ],
                            ),
                            Text(
                              "File: ${_truncateText(data.file, 15)}",
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
                            contactProvider.startEditing(data);
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
                                    TextButton(
                                      child: const Text("Ya"),
                                      onPressed: () {
                                        // Mengambil indeks item yang sesuai dengan button delete yang diklik
                                        int itemIndex = contactProvider.contacts
                                            .indexWhere((item) =>
                                                item.name == data.name &&
                                                item.nomor == data.nomor);
                                        // Hapus item dari dataList menggunakan fungsi dari provider
                                        if (itemIndex >= 0) {
                                          contactProvider.deleteContact(
                                              contactProvider
                                                  .contacts[itemIndex]);
                                        }
                                        // Tutup Konfirmasi Hapus
                                        Navigator.of(context).pop();
                                        contactProvider.isEditing = false;
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

// Membuat Fungsi membatasi panjang sebuah text
  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
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
                  final contactProvider =
                      context.read<contact_store.ContactProvider>();
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: contactProvider.dueDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(contactProvider.currentDate.year + 5),
                  );
                  if (selectDate != null) {
                    contactProvider.setDueDate(selectDate);
                  }
                },
                child: const Text("Select"),
              ),
            ],
          ),
          Consumer<contact_store.ContactProvider>(
            builder: (context, contactProvider, child) {
              return Text(DateFormat('EEEE-dd-MM-yyyy')
                  .format(contactProvider.dueDate));
            },
          ),
        ],
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Consumer<contact_store.ContactProvider>(
      builder: (context, contactProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Color"),
            Container(
              height: 100,
              width: double.infinity,
              color: contactProvider.currentColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(contactProvider.currentColor),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Pick your color"),
                      content: BlockPicker(
                        pickerColor: contactProvider.currentColor,
                        onColorChanged: (Color color) {
                          contactProvider.setCurrentColor(color);
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
                  },
                );
              },
              child: const Text("Pick Color"),
            ))
          ],
        );
      },
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Consumer<contact_store.ContactProvider>(
      builder: (context, contactProvider, child) {
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
                  contactProvider.pickFile();
                },
                child: Text(contactProvider.selectedFileName),
              ),
            ),
            if (contactProvider.filePath != null)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (contactProvider.filePath != null) {
                      contactProvider.openFile(contactProvider.filePath!);
                    }
                  },
                  child: const Text("Open File"),
                ),
              ),
          ],
        );
      },
    );
  }
}
