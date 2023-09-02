import 'Calculator.dart';

void main() {
  Calculator calculator = Calculator();

  print('Hasil Penjumlahan: ${calculator.penjumlahan()}');

  print('Hasil Pengurangan: ${calculator.pengurangan()}');

  print('Hasil Perkalian: ${calculator.perkalian()}');

  print('Hasil Pembagian: ${calculator.pembagian()}');
}