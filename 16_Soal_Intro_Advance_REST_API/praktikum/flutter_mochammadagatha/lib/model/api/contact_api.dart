import 'package:dio/dio.dart';
import 'package:flutter_mochammadagatha/model/model.dart';

import '../../utils/urls.dart';
  final Dio _dio = Dio();
// class ContactAPI {
//   static Future<List<Users>> getContact() async {
//     final response = await Dio().get(Urls.baseURL + Urls.users);

//     List<Users> contacts = (response.data as List)
//         .map((e) => Users(
//               // id : e['id'],
//               name: e['name'],
//               nomor: e['nomor'],
//             ))
//         .toList();
//     return contacts;
//   }
// }
  Future<Users> fetchUsers() async {
    try {
      final response = await _dio.get(Urls.baseURL + Urls.users);

      return Users.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
void postData() async {
  Dio dio = Dio();

  try {
    Users user = Users(
      name: 'John Doe',
      job: 'Developer',
      id: '123',
      createdAt: DateTime.now(),
    );

    Response response = await dio.post(
      Urls.baseURL + Urls.users,
      data: user.toJson(),
    );

    if (response.statusCode == 200) {
      print('Data berhasil dikirim.');
      print('Response data: ${response.data}');
    } else {
      print('Gagal mengirim data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

  // Future<Users> fetchUserDetail({required String id}) async {
  //   try {
  //     final response = await _dio.get('${Urls.baseUrl}${Urls.users}/$id');

  //     return UserDetailModel.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }