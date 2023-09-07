import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> dataList = [
      ['Leanne Graham', 'L', '1-770-736-8031 x56442'],
      ['Ervin Howell', 'E', '010-692-6593 x09125'],
      ['Clementine Bauch', 'C', '1-463-123-4447'],
      ['Patricia Lebsack', 'P', '493-170-9623 x156'],
      ['Chelsey Dietrich', 'C', '(254)954-1289'],
      ['Mrs. Dennis Schulist', 'M', '1-477-935-8478 x6430'],
      ['Kurtis Weissnat', 'K', '210.067.6132'],
      ['Leanne Graham', 'L', '1-770-736-8031 x56442'],
      ['Ervin Howell', 'E', '010-692-6593 x09125'],
      ['Clementine Bauch', 'C', '1-463-123-4447'],
      ['Patricia Lebsack', 'P', '493-170-9623 x156'],
      ['Chelsey Dietrich', 'C', '(254)954-1289'],
      ['Mrs. Dennis Schulist', 'M', '1-477-935-8478 x6430'],
      ['Kurtis Weissnat', 'K', '210.067.6132'],
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaterialApp"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text("Home")),
            ListTile(title: Text("Setting")),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Text(
                      "${dataList[index][1]}",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${dataList[index][0]}"),
                    Text("${dataList[index][2]}"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
    );
  }
}
