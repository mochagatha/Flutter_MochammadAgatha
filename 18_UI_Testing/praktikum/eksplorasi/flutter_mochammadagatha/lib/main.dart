import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/view/gridview_screen.dart';
import 'package:flutter_mochammadagatha/view/show_image.dart';
import 'package:flutter_mochammadagatha/view/create_new_contacts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mochammadagatha/controller/contact.dart' as contact_store;

void main() {
  // runApp(const MyApp());
    runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => contact_store.ContactProvider())
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const CreateNewContacts(),
        '/showImage': (_) => const showImage(),
        '/contacts': (_) => const GridviewScreen(),
      },
    );
  }
}
