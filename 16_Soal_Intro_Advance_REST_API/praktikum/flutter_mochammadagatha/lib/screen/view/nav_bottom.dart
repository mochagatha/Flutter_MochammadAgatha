import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/screen/view/contact_screen.dart';
import 'package:flutter_mochammadagatha/screen/view/generate_foto.dart';
import 'package:flutter_mochammadagatha/screen/view/image_screen.dart';
import 'package:provider/provider.dart';
import '../view_model/contact_view_model.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<ContactViewModel>(context);
    return Scaffold(
      body: Consumer<ContactViewModel>(
        builder: (context, contactModel, child) {
          final List<Widget> screens = [
            const ContactScreen(),
            const Prioritas2(),
            const GenerateFoto(),
          ];
          return screens[modelview.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<ContactViewModel>(
        builder: (context, contactModel, child) {
          return BottomNavigationBar(
            currentIndex: contactModel.currentIndex,
            onTap: (index) {
              contactModel.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_outlined),
                label: 'Generate Foto',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                label: 'Generate Foto',
              ),
            ],
          );
        },
      ),
    );
  }
}
