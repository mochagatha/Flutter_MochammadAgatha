import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Masukkan Sisi dari persegi :");
  int s = int.parse(stdin.readLineSync()!);
  int rumusKeliling = 4 * s;
  int rumusLuas = s * s;

  print("Keliling Persegi = $rumusKeliling");
  print("Luas persegi = $rumusLuas");
  print(
      "=====================================================================");
  print("Masukkan panjang dari Persegi Panjang:");
  int p = int.parse(stdin.readLineSync()!);
  print("Masukkan lebar dari Persegi Panjang:");
  int l = int.parse(stdin.readLineSync()!);

  int KelilingPersegiPanjang = 2 * (p + l);
  int LuasPersegiPanjang = p * l;
  print("Keliling Persegi Panjang = $KelilingPersegiPanjang");
  print("Luas persegi Panjang = $LuasPersegiPanjang");
  print("========================Soal Prioritas1 No. 2========================");
  print("Masukkan Jari-jari dari Lingkaran:");
  int r = int.parse(stdin.readLineSync()!);
  double LuasLingkaran = pi * r * r;
  double KelilingLingkaran = 2 * pi * r;
  print("Keliling Lingkaran = $KelilingLingkaran");
  print("Luas Lingkaran = $LuasLingkaran");
}
