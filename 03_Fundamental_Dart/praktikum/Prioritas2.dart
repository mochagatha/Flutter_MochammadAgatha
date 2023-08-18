import 'dart:io';
import 'dart:math';

void main() {
  String nama = ("Agatha");
  String nama2 = ("Latifah");
  String nama3 = ("Kyy");
  print("Hello, nama saya $nama mempunyai teman bernama $nama2 dan $nama3");

  print("========================Soal Prioritas2 No. 2========================");

  print("Masukkan Jari-jari dari Tabung:");
  int r = int.parse(stdin.readLineSync()!);
  print("Masukkan Tinggi dari Tabung:");
  int t = int.parse(stdin.readLineSync()!);
  var rumus = pi * (r * r) * t;

  print("Volume Tabung = $rumus");
}
