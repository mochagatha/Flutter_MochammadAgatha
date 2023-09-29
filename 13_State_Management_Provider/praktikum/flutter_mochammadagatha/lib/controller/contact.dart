import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/model.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class Contact with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color currentColor = const Color(0xFF6750A4);
  String selectedFileName = "Pick Your File";
  String? filePath;
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;
  String editedName = '';
  String editedNomor = '';
  bool isEditing = false;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(GetContact editedContact, String newName, String newNomor,
      String newDate, String newColor, String newFile) {
    final contactIndex =
        _contacts.indexWhere((contact) => contact == editedContact);

    if (contactIndex != -1) {
      _contacts[contactIndex].name = newName;
      // _contacts[contactIndex].firstLetter =
      //     newName.isNotEmpty ? newName[0] : '';
      _contacts[contactIndex].nomor = newNomor;
      _contacts[contactIndex].date = newDate;
      _contacts[contactIndex].color = newColor;
      _contacts[contactIndex].file = newFile;

      notifyListeners();
    }
  }

  void deleteContact(GetContact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void setDueDate(DateTime newDueDate) {
    dueDate = newDueDate;
    notifyListeners();
  }

  void setCurrentColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;

    selectedFileName = file.name;
    filePath = file.path!;

    notifyListeners();
  }

  void openFile(String filePath) {
    OpenFile.open(filePath);
    notifyListeners();
  }

  void cancelEdit() {
    isEditing = false;
    editedName = '';
    editedNomor = '';
    nameController.clear();
    nomorController.clear();
    selectedFileName = "Pick Your File";
    filePath = null;
    notifyListeners();
  }

  void startEditing(GetContact contact) {
    editedName = contact.name;
    editedNomor = contact.nomor;
    nameController.text = contact.name;
    nomorController.text = contact.nomor;
    currentColor = Color(int.parse("0x${contact.color}"));
    dueDate = DateFormat('EEEE-dd-MM-yyyy').parse(contact.date);
    selectedFileName = contact.file;
    isEditing = true;
    notifyListeners();
  }
}
