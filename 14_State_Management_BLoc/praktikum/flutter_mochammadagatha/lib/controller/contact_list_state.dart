import 'package:flutter_mochammadagatha/model/contacts_bloc.dart';
abstract class ContactListState{
  List<Contact> contact;
  ContactListState({required this.contact});
}
class ContactListAll extends ContactListState{
  ContactListAll({required List<Contact> contact}) : super(contact: contact);
}

class ContactListUpdated extends ContactListState{
  ContactListUpdated({required List<Contact> contact}) : super(contact: contact);
}