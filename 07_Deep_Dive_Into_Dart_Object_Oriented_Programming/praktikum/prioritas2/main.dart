import 'Fpb.dart';
import 'Kpk.dart';

void main() {
  int a = 80;
  int b = 24;

  KPK kpk = KPK(a, b);
  FPB fpb = FPB(a, b);

  print('KPK dari $a dan $b adalah: ${kpk.hasil(a, b)}');
  print('FPB dari $a dan $b adalah: ${fpb.hasil(a, b)}');
}