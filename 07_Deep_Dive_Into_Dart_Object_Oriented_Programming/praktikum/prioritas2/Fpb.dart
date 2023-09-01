import 'matematika.dart';

class FPB implements Matematika {
  int x;
  int y;

  FPB(this.x, this.y);

  @override
  int hasil(int x, int y) {
    if (x == 0 || y == 0) {
      print("Tidak boleh 0");
      return 0;
    }
    for (null; x != y;) {
      /// diawali nilai null, X dan Y akan di loop sampai menemui nilai yang sama.
      if (x > y) {
        x -= y;
      } else {
        y -= x;
      }
    }
    return x;
  }
}
