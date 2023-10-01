// import 'dart:ui';
// import 'package:flutter_mochammadagatha/model/contacts_bloc.dart';

// abstract class ContactListEvent {}

// class AddContact extends ContactListEvent {
//   final Contact contact;
//   AddContact({required this.contact});
// }

// class EditContact extends ContactListEvent {
//   final int index;
//   final String newname;
//   final String newNumber;
//   final Color newColor;
//   final String newFileName;
//   EditContact({
//     required this.index,
//     required this.newname,
//     required this.newNumber,
//     required this.newColor,
//     required this.newFileName,
//   });
// }
part of 'contact_list_bloc.dart';

abstract class ContactListEvent {
  const ContactListEvent();

  List<Object> get props => [];
}

class AddContactEvent extends ContactListEvent {
  final ContactModel contact;

  AddContactEvent(this.contact);
}

class DeleteContactEvent extends ContactListEvent {
  final int index;

  DeleteContactEvent(this.index);
}

class ChangeContactEvent extends ContactListEvent {
  final int index;
  final ContactModel contact;

  ChangeContactEvent(this.contact, this.index);
}