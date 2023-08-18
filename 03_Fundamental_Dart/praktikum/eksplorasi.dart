import 'dart:io';

void main() {
  bool isPalindrome(String text) {
    text = text.replaceAll(' ', '');
    return text == text.split('').reversed.join('');
  }

  print('Masukkan sebuah kata:');
  String input = stdin.readLineSync() ?? '';

  if (isPalindrome(input)) {
    print('$input adalah palindrom');
  } else {
    print('$input bukan palindrom');
  }
  print("========================Soal Eksplorasi No. 2========================");
  print("Masukan sebuah bilangan :");

  int bilangan = int.parse(stdin.readLineSync()!);

  print("faktor faktor dari $bilangan adalah : ");
  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
