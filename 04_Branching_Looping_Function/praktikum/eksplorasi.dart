import 'dart:io';

bool isPrima(int n) {
  if (n < 1) {
    return false;
  }
  if (n <= 3) {
    return true;
  }
  if (n % 2 == 0 || n % 3 == 0) {
    return false;
  }
for (int i = 5; i * i <= n; i += 6) {
  if (n % i == 0 || n % (i + 2) == 0) {
    return false;
  }
}
  return true;
}

void main() {
  stdout.write("Masukkan sebuah bilangan: ");
  int input_n = int.parse(stdin.readLineSync()!);

  if (isPrima(input_n)) {
    print("$input_n Adalah Bilangan Prima");
  } else {
    print("$input_n Bukan Bilangan Prima");
  }


  print("\n\n========================Soal Eksplorasi No. 2========================");
  int row = 9; /// jumlah baris pada tabel perkalian
  for (int i = 1; i <= row; i++) {
    print(List.generate(row, (col) => "${(i) * (col + 1)}".padLeft(2)).join(" "));
  }
}
