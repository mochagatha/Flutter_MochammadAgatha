part of 'contact_list_bloc.dart';

@immutable
class ContactListState {
  final List<ContactModel> contactList;

  ContactListState.empty() : contactList = [];

  const ContactListState(this.contactList);

  List<Object?> get props => [contactList];
}