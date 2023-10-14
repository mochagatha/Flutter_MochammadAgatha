import 'package:flutter/material.dart';
import 'package:open_ai/view/screen/rekomendasi_hp.dart';
import 'package:open_ai/view/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HandphoneViewModel())
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RekomendasiHp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
