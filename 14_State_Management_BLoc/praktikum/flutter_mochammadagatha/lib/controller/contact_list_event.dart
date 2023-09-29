import 'dart:ui';
import 'package:flutter_mochammadagatha/model/contacts_bloc.dart';

abstract class ContactListEvent {}

class AddContact extends ContactListEvent {
  final Contact contact;
  AddContact({required this.contact});
}

class EditContact extends ContactListEvent {
  final int index;
  final String newname;
  final String newNumber;
  final Color newColor;
  final String newFileName;
  EditContact({
    required this.index,
    required this.newname,
    required this.newNumber,
    required this.newColor,
    required this.newFileName,
  });
}

class RemoveContact extends ContactListEvent {
  final int index;
  RemoveContact({required this.index});
}
