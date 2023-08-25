import 'dart:io';
import 'dart:math';

void main() {
  int tinggiPiramid = 8; ///tinggi piramid

  for (int i = 0; i < tinggiPiramid; i++) {
    for (int j = 0; j < tinggiPiramid - i; j++) { 
      stdout.write("  ");/// mencetak jumlah spasi pada baris
    }
    for (int k = 0; k < 2 * i + 1; k++) {
      stdout.write("* ");///mencetak bintang
      
    }
    stdout.writeln(); ///Mencetak agar bisa newline
  }



  print("\n \n========================Soal Prioritas2 No. 2========================");
  int tinggi = 6; 
  int n = 2 * tinggi - 1;

  // Bagian atas jam pasir
  for (int i = 0; i < tinggi; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(" ");/// mencetak jumlah spasi pada setiap baris
    }
    for (int j = 0; j < n; j++) {
      stdout.write("0");///mencetak 0
    }
    n -= 2; /// Mengurangi 2 pada tiap baris berikutnya.
    stdout.writeln();///Mencetak agar bisa newline
  }

  n = 3;
  // Bagian bawah jam pasir
  for (int i = 0; i < tinggi - 1; i++) {
    for (int j = 0; j < tinggi - i - 2; j++) {
      stdout.write(" ");/// mencetak jumlah spasi pada setiap baris
    }
    for (int j = 0; j < n; j++) {
      stdout.write("0");///mencetak 0
    }
    n += 2;/// Menambah 2 pada tiap baris berikutnya.
    stdout.writeln();///Mencetak agar bisa newline
  }



  print("\n \n========================Soal Prioritas2 No. 3========================");
  BigInt hasilA = factorial(10);
  BigInt hasilB = factorial(40);
  BigInt hasilC = factorial(50);

  print("Faktorial dari 10 adalah $hasilA");
  print("Faktorial dari 40 adalah $hasilB");
  print("Faktorial dari 50 adalah $hasilC");



  print("\n \n===================Soal Prioritas2 Tugas Function====================");
  double hasilLingkaran = lingkaran(9);
  print(hasilLingkaran);
}


///function factorial
BigInt factorial(int nilai) {
  BigInt hasil = BigInt.one; ///memulai operasi perkalian dengan nilai awal 1
  for (int i = 1; i <= nilai; i++) {
    hasil *= BigInt.from(i); ///mengalikan nilai yang ada di variabel hasil dengan nilai yang ada di (i)
  }
  return hasil;
}

///function lingkaran
double lingkaran(int r) {
  return pi * (r * r);
}
