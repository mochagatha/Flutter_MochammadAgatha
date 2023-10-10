import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController comment = TextEditingController();
  List<List<dynamic>> dataList = [];

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }

    RegExp regex = RegExp(r'[!@#%^&*(),.?":{}|<>]');

    if (regex.hasMatch(value)) {
      return 'Nama tidak boleh mengandung karakter khusus';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (!regex.hasMatch(value)) {
      return 'Alamat email tidak valid';
    }

    // return null;
    return null;
  }

  void add() {
    dataList.add([firstName.text, lastName.text, email.text, comment.text]);
    firstName.clear();
    lastName.clear();
    email.clear();
    comment.clear();
    notifyListeners();
  }
}
