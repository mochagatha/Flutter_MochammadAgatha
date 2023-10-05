// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mochammadagatha/model/model.dart';
// import '../../model/model_ubah_json.dart';
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
    String imageUrl = "https://api.dicebear.com/7.x/initials/svg?seed=$initial";
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
