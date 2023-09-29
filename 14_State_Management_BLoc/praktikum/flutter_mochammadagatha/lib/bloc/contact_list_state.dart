// import 'package:flutter_mochammadagatha/model/contacts_bloc.dart';
// abstract class ContactListState{
//   List<Contact> contact;
//   ContactListState({required this.contact});
// }
// class ContactListAll extends ContactListState{
//   ContactListAll({required List<Contact> contact}) : super(contact: contact);
// }

// class ContactListUpdated extends ContactListState{
//   ContactListUpdated({required List<Contact> contact}) : super(contact: contact);
// }
part of 'contact_list_bloc.dart';

@immutable
class ContactListState {
  final List<ContactModel> contactList;

  ContactListState.empty() : contactList = [];

  const ContactListState(this.contactList);

  List<Object?> get props => [contactList];
}