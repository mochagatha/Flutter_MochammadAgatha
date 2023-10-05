import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/screen/contact/contact_screen.dart';
import 'package:flutter_mochammadagatha/screen/contact/generate_foto.dart';
import 'package:flutter_mochammadagatha/screen/contact/image_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mochammadagatha/screen/contact/contact_view_model.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

// late ContactViewModel modelview;

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  // void initState() {
  //   modelview = Provider.of<ContactViewModel>(context, listen: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<ContactViewModel>(context);
    return Scaffold(
      body: Consumer<ContactViewModel>(
        builder: (context, contactModel, child) {
          final List<Widget> _screens = [
            const ContactScreen(),
            const Prioritas2(),
            const GenerateFoto(),
          ];
          return _screens[modelview.currentIndex];
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
