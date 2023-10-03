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