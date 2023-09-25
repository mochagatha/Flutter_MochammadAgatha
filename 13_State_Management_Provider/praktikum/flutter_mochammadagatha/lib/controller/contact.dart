import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/model.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

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
      _contacts[contactIndex].firstLetter =
          newName.isNotEmpty ? newName[0] : '';
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
}
