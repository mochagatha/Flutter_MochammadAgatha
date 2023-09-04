import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halo Alterra",
          style: GoogleFonts.akronim(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
        // backgroundColor: const Color.fromARGB(255, 83, 97, 108),
        actions: const [],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama saya adalah Mochammad Agatha Rahmawan Putra",
              style: GoogleFonts.roboto(
                color: const Color(0xFF4D4D4D),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
