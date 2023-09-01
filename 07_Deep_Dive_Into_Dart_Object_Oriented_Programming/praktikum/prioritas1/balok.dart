import 'bangunRuang.dart';

class Balok extends bangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  int volume() {
    return panjang * lebar * tinggi;
  }
}
