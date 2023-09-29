import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_mochammadagatha/app_screen/get_contact_bloc/bloc/contact_list_bloc.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_bloc/model/contact_model.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/contact_card.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/input_field.dart';
// import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/tittle_and_description.dart';

import '../bloc/contact_list_bloc.dart';
import '../model/contact_model.dart';
import 'contact_card.dart';
import 'input_field.dart';
import 'tittle_and_description.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  late ContactListBloc contactList;

  ScrollController scrollController = ScrollController();

  bool mode = false;

  int? contentIndex;

  Color pickedColor = Colors.blue;

  String? pickedFile = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    contactList = BlocProvider.of<ContactListBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    numberController.dispose();
    dateController.dispose();
  }

  void getColorData(Color? color) {
    if (color != null) {
      pickedColor = color;
    }
  }

  void getFilePath(String? file) {
    if (file != null) {
      pickedFile = file;
    }
  }

  void edit(int index) {
    scrollController.jumpTo(0.0);
    mode = true;

    final ContactModel contact =
        context.read<ContactListBloc>().state.contactList[index];

    debugPrint('Contact Data : ${contact.toString()}');

    nameController.text = contact.name;
    numberController.text = contact.number;
    dateController.text = contact.date;
    pickedColor = contact.color;
    pickedFile = contact.file;

    contentIndex = index;
  }

  void delete(int index) {
    context.read<ContactListBloc>().add(DeleteContactEvent(index));
  }

  void updateData() {
    ContactModel contact = ContactModel(
        name: nameController.text,
        number: numberController.text,
        date: dateController.text,
        color: pickedColor,
        file: pickedFile.toString());

    if (mode) {
      mode = false;
      context
          .read<ContactListBloc>()
          .add(ChangeContactEvent(contact, contentIndex!));
    } else {
      context.read<ContactListBloc>().add(AddContactEvent(contact));
    }

    nameController.clear();
    numberController.clear();
    dateController.clear();
    pickedColor = Colors.blue;

    debugPrint("Data List: ${contactList.state.contactList.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ContactListBloc'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              fileGetter: getFilePath,
              colorGetter: getColorData,
              dateController: dateController,
              contactList: contactList.state.contactList,
              notifyParent: updateData,
              nameInputController: nameController,
              numberInputController: numberController,
            ),
            const Text(
              "Contact List",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            BlocConsumer<ContactListBloc, ContactListState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.contactList.length,
                  itemBuilder: (context, index) {
                    final ContactModel contact = state.contactList[index];
                    return ContactCard(
                      filePath: contact.file,
                      name: contact.name,
                      number: contact.number,
                      date: contact.date,
                      color: contact.color.toString(),
                      delete: () => delete(index),
                      edit: () => edit(index),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}