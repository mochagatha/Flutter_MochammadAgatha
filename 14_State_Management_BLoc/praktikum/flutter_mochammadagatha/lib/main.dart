import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';
import 'bloc/contact_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContactListBloc(),
          ),
        ],
        child: const CreateNewContacts(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
