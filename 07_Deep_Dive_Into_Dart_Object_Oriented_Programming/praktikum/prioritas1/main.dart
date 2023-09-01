import 'balok.dart';
import 'kubus.dart';

void main() {
  Kubus kubus = Kubus(5);
  print('Volume Kubus: ${kubus.volume()}');

  Balok balok = Balok(5, 3, 6);
  print('Volume Balok: ${balok.volume()}');
}