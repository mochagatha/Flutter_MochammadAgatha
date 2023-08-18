import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Masukkan Sisi dari persegi :");
  int s = int.parse(stdin.readLineSync()!);
  var rumusKeliling = 4 * s;
  var rumusLuas = s * s;

  print("Keliling Persegi = $rumusKeliling");
  print("Luas persegi = $rumusLuas");
  print(
      "=====================================================================");
  print("Masukkan panjang dari Persegi Panjang:");
  int p = int.parse(stdin.readLineSync()!);
  print("Masukkan lebar dari Persegi Panjang:");
  int l = int.parse(stdin.readLineSync()!);

  var KelilingPersegiPanjang = 2 * (p + l);
  var LuasPersegiPanjang = p * l;
  print("Keliling Persegi Panjang = $KelilingPersegiPanjang");
  print("Luas persegi Panjang = $LuasPersegiPanjang");
  print("========================Soal Prioritas1 No. 2========================");
  print("Masukkan Jari-jari dari Lingkaran:");
  int r = int.parse(stdin.readLineSync()!);
  var LuasLingkaran = pi * r * r;
  var KelilingLingkaran = 2 * pi * r;
  print("Keliling Lingkaran = $KelilingLingkaran");
  print("Luas Lingkaran = $LuasLingkaran");
}
