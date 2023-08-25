import 'dart:io';

void main() {
  stdout.write("Masukkan jumlah Nilai: "); ///input nilai
  int n = int.parse(stdin.readLineSync()!); ///konversi hasil inputan
  if (n > 70) {
    print("Nilai A");
  } else if (n > 40) {
    print("Nilai B");
  } else if (n > 0) {
    print("Nilai C");
  } else {
    print("");
  }

  print("========================Soal Prioritas1 No. 2========================");
/// Melakukan perulangan dari 1 sampai 10
  for (int i = 1; i <= 10; i ++) {
    print(i);
  }
}
