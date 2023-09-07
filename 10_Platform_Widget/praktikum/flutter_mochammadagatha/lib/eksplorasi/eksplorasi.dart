// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class eksplorasi extends StatelessWidget {
  const eksplorasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> dataList = [
      ['Learn flutter'],
      ['Learn ReactJS'],
      ['Learn VueJS'],
      ['Learn Tailwind CSS'],
      ['Learn UI/UX'],
      ['Learn Figma'],
      ['Learn Digital Marketing'],
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: Text(
          "My Flutter App",
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${dataList[index][0]}",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Divider(thickness: 1),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.black),
          backgroundColor: const Color(0xFF03DAC5),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.error), label: 'Information'),
          ]),
    );
  }
}
