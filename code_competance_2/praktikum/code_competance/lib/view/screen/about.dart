import 'package:code_competance/view/screen/home_page.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {},
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text("Home Page"),
              ),
            ),
            const ListTile(title: Text("Contact Us")),
            const ListTile(title: Text("Login")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Center(
              child: Text(
                'Alterra Academy Programs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          Image.network(
                            "https://static-00.iconduck.com/assets.00/web-developer-illustration-1004x1024-wcqgbag3.png",
                            width: 50,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Immersive Program',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Program pelatihan coding bootcamp intensif bagi kamu yang pemula. baik dengan latar belakang IT maupun Non-IT untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          Image.network(
                            "https://static-00.iconduck.com/assets.00/web-developer-illustration-1004x1024-wcqgbag3.png",
                            width: 50,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Immersive Program',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Program pelatihan coding bootcamp intensif bagi kamu yang pemula. baik dengan latar belakang IT maupun Non-IT untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
