// import 'dart:convert';

// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/model.dart';
import '../../model/model_ubah_json.dart';
import '../../utils/urls.dart';

class ContactViewModel with ChangeNotifier {
  int currentIndex = 0;
  Users responseData = Users();
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController initial = TextEditingController();
  String hasilGenerateGambar = '';
  String getGambar = "";
  
  final Dio _dio = Dio();

  Future addData({required String name, required String job}) async {
    try {
      Map<String, dynamic> userData = {
        "name": name,
        "job": job,
        "createdAt": DateTime.now().toIso8601String()
      };
      Response user = await _dio.post(
        Urls.baseURL + Urls.users,
        data: userData,
      );
      if (user.statusCode == 201) {
        print('Data berhasil dikirim.');
        print('Response data: ${user.data}');
        responseData = Users(
            id: user.data['id'],
            name: user.data['name'],
            job: user.data['job']);
      } else {
        print('Gagal mengirim data. Status code: ${user.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future getImage() async {
    try {
      String imageUrl = "https://api.dicebear.com/7.x/lorelei/svg";
      Response respon = await _dio.get(imageUrl);
      if (respon.statusCode == 200) {
        print('Berhasil Mengambil foto Foto');
        getGambar = imageUrl;
        print("coba print: $imageUrl");
      } else {
        print('Gagal mengirim data. Status code: ${respon.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future generateInitial({required String initial}) async {
    try {
      String imageUrl =
          "https://api.dicebear.com/7.x/initials/svg?seed=$initial";
      Response respon = await _dio.get(imageUrl);
      if (respon.statusCode == 200) {
        print('Berhasil Create Foto');

        hasilGenerateGambar = imageUrl;
        print("coba print: $imageUrl");
      } else {
        print('Gagal mengirim data. Status code: ${respon.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future updatePost() async {
    Map<String, dynamic> data = {
      "id": 1,
      "title": "foo",
      "body": "bar",
      "userId": 1,
    };

    try {
      Response response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data berhasil diperbarui');
        print(response.data);
      } else {
        print('Gagal memperbarui data');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

Future fetchDataJSON() async {
  const String apiUrl = "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2";

  try {
    final response = await _dio.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;

      Contact contact = Contact.fromJson(data);

      print('ID: ${contact.id}');
      print('Name: ${contact.name}');
      print('Phone: ${contact.phone}');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
  // Future ubahJson() async {
  // try {
  //   final response = await _dio.get("https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2");

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.data);

  //     contact = Contact.fromJson(data).toString();

  //     print('ID: ${contact.id}');
  //     print('Name: ${contact.name}');
  //     print('Phone: ${contact.phone}');
  //   } else {
  //     print('Failed to load data. Status code: ${response.statusCode}');
  //   }
  // } catch (e) {
  //   print('An error occurred: $e');
  // }

  //   notifyListeners();
  // }
  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
