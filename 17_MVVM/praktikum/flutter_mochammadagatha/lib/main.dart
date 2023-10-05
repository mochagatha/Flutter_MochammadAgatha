import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/view/ViewModel/view_model_contact.dart'as contact_store;
import 'package:provider/provider.dart';
import 'view/Screen/contacts_screen.dart';
import 'view/Screen/gridview_screen.dart';
import 'view/Screen/show_image.dart';

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
        '/showImage': (_) => const ShowImage(),
        '/contacts': (_) => const GridviewScreen(),
      },
    );
  }
}
