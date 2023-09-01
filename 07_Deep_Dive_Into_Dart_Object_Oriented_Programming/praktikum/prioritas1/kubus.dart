import 'bangunRuang.dart';

class Kubus extends bangunRuang {
  late int sisi;

  Kubus(int sisi) : super(sisi, sisi, sisi) {
    this.sisi = sisi;
  }

  @override
  volume() {
    return sisi * sisi * sisi;
  }
}
