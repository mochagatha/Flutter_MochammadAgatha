

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:open_ai/view/screen/hasil_generate.dart';
import 'package:open_ai/view/viewmodel/token.dart';

class HandphoneViewModel with ChangeNotifier {
  final Dio _dio = Dio();
  TextEditingController budget = TextEditingController();
  TextEditingController camera = TextEditingController();
  TextEditingController storage = TextEditingController();

  Future<void> makeApiRequest(BuildContext context) async {
    // const authToken = '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';

    _dio.options = BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      headers: {
        'Authorization': 'Bearer ${Token.authToken}',
      },
    );
    try {
      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "berikan saya rekomendasi hp dengan budget $budget, kamera $camera MP, dan storage $storage GB",
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        print(responseData);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HasilGenerate(responseData: responseData),
          ),
        );
      } else {
        print('Failed to make API request: ${response.statusCode}');
      }
    } catch (error) {
      // An error occurred
      print('Error: $error');
    } 
  }
}
