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
                                textCapitalization: TextCapitalization.words,
                                decoration: const InputDecoration(
                                  labelText: 'First name',
                                  hintText: 'Insert Your Name',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFE7E0EC),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                // validator: validateName,
                                onChanged: (value) {},
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 2.2,
                              ),
                              child: TextFormField(
                                controller: lastName,
                                textCapitalization: TextCapitalization.words,
                                decoration: const InputDecoration(
                                  labelText: 'Last name',
                                  hintText: 'Insert Your Name',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFE7E0EC),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                // validator: validateName,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: email,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Insert Your Name',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFE7E0EC),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          // validator: validateName,
                          onChanged: (value) {},
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
                      if (formKey.currentState!.validate()) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.green,
                            child: Center(
                              child: Text(
                                "${data[0]}",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data[1]}"),
                              Text(
                                "${(data[3])}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ],
                          ),
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
}
