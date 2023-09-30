import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/model.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import '../model/db_manager.dart';

class ContactProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color currentColor = const Color(0xFF6750A4);
  String selectedFileName = "Pick Your File";
  String? filePath;
  final List<ModelContact> _contacts = [];
  List<ModelContact> get contacts => _contacts;
  String editedName = '';
  String editedNomor = '';
  bool isEditing = false;
  final dbHelper = DatabaseHelper();

  Future<void> fetchContacts() async {
    final contacts = await dbHelper.getContacts();
    _contacts.addAll(contacts);
    notifyListeners();
  }

  void add(ModelContact contact) async {
    await dbHelper.insertContact(contact);
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(ModelContact editedContact, String newName, String newNomor,
      String newDate, String newColor, String newFile) async {
    final contactIndex =
        _contacts.indexWhere((contact) => contact == editedContact);

    if (contactIndex != -1) {
      _contacts[contactIndex].name = newName;
      _contacts[contactIndex].nomor = newNomor;
      _contacts[contactIndex].date = newDate;
      _contacts[contactIndex].color = newColor;
      _contacts[contactIndex].file = newFile;
      await dbHelper.updateContact(editedContact);
      
     
    }
     notifyListeners();
  }

  void deleteContact(ModelContact contact) async {
    await dbHelper.deleteContact(contact.id);
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

  void startEditing(ModelContact contact) {
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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }
    List<String> words = value.split(' ');

    for (String word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        return 'Nama boleh tidak mengandung angka atau karakter khusus.';
      }
    }
    if (words.length < 2) {
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
}
