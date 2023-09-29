// class Contact {
//   String name = '';
//   String nomor = '';
//   String date = '';
//   String color = '';
//   String file = '';

//   Contact(
//       {required this.name,
//       required this.nomor,
//       required this.date,
//       required this.color,
//       required this.file});
// }

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_bloc/model/contact_model.dart';
import 'package:meta/meta.dart';

import '../model/contact_model.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc() : super(ContactListState.empty()) {
    on<AddContactEvent>(
      (event, emit) {
        state.contactList.add(event.contact);

        emit(ContactListState(state.contactList));
      },
    );

    on<DeleteContactEvent>(
      (event, emit) {
        state.contactList.removeAt(event.index);

        emit(ContactListState(state.contactList));
      },
    );

    on<ChangeContactEvent>(
      (event, emit) {
        state.contactList[event.index] = event.contact;

        emit(ContactListState(state.contactList));
      },
    );
  }
}