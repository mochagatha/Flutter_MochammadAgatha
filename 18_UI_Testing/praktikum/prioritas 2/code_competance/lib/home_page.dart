import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController comment = TextEditingController();
  List<List<dynamic>> dataList = [];

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nama wajib diisi';
  }
  
  RegExp regex = RegExp(r'[!@#%^&*(),.?":{}|<>]');

  if (regex.hasMatch(value)) {
    return 'Nama tidak boleh mengandung karakter khusus';
  }

  return null;
}
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email wajib diisi';
  }

  // Pola RegEx untuk validasi email
  RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  if (!regex.hasMatch(value)) {
    return 'Alamat email tidak valid';
  }

  return null;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text("Home")),
            ListTile(title: Text("Setting")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/banner.webp'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.colorBurn,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Coding Bootcamp Penghasil\nProgrammer Dengan Kualitas\nTinggi di Indonesia",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Alterra Academy adalah coding bootcamp\nindonesia untuk semua orang baik dengan\nbackground IT & non-IT untuk menjadi\nProgrammer dengan kualitas terbaik di\nindustri saat ini.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 176, 57),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Pelajari Lebih Lanjut",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'Need to get in touch us? Either fill out the form\nwith your inquiry or find the ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        TextSpan(
                          text: 'department email',
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: " you'd\nlike to contact below",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 2.2,
                              ),
                              child: TextFormField(
                                controller: firstName,
                                cursorColor: Colors.black45,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  hintText: 'First name',
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: validateName,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 2.2,
                              ),
                              child: TextFormField(
                                controller: lastName,
                                cursorColor: Colors.black45,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  hintText: 'Last name',
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: validateName,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: validateEmail,
                          controller: email,
                          cursorColor: Colors.black45,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black45,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: comment,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                              hintText: 'Masukkan komentar di sini...',
                              border: OutlineInputBorder()),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      String alertFirstName = firstName.text;
                      String alertLastName = lastName.text;
                      String alertEmail = email.text;
                      String alertComment = comment.text;
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                    'Apakah anda yakin ingin mengirim ini?'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Nama: $alertFirstName  $alertLastName'),
                                    Text('Email: $alertEmail'),
                                    Text('Komentar: $alertComment'),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      dataList.add([
                                        firstName.text,
                                        lastName.text,
                                        email.text,
                                        comment.text
                                      ]);
                                      firstName.clear();
                                      lastName.clear();
                                      email.clear();
                                      comment.clear();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Feedback',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              for (var data in dataList)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          color: Colors.white,
                          Icons.person,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data[0]} ${data[1]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17)),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                color: Colors.orange,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _truncateText(data[3], 95),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
