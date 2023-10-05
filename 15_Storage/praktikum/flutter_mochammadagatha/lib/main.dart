import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/db_manager.dart';
import 'package:flutter_mochammadagatha/view/login.dart';
import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mochammadagatha/controller/contact.dart'
    as contact_store;
import 'controller/contact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final contactProvider = DatabaseHelper();
  await contactProvider.initDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => contact_store.ContactProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final contactProvider = ContactProvider();
  @override
  Widget build(BuildContext context) {
    contactProvider.fetchContacts();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const LoginScreen(),
        'Contact': (_) => const CreateNewContacts(),
      },
    );
  }
}
