import 'dart:convert';
// import 'package:dio/dio.dart';
// import '../../model/model_ubah_json.dart';

// void main() async {
//   final dio = Dio();
//   final url = 'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2';

//   try {
//     final response = await dio.get(url);
    
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.data);

//       final contact = Contact.fromJson(data);

//       print('ID: ${contact.id}');
//       print('Name: ${contact.name}');
//       print('Phone: ${contact.phone}');
//     } else {
//       print('Failed to load data. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('An error occurred: $e');
//   }
// }
void main(List<String> args) {

  var dataMap ={
    "name": "Json Thor",
    "age": 20,
  };
  var dataJSON = jsonEncode(dataMap);
  print(dataJSON);
}