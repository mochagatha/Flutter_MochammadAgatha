import 'matematika.dart';

class KPK implements Matematika {
  int x;
  int y;

  KPK(this.x, this.y);

  @override
  int hasil(int x, int y) {
    if (x == 0 || y == 0) {
      print("Tidak boleh 0");
      return 0;
    }
    int m = x;

    /// Menyimpan nilai awal X
    int n = y;

    /// Menyimpan nilai awal Y

    for (null; x != y;) {
      /// diawali nilai null, X dan Y akan di loop sampai menemui nilai yang sama.
      if (x > y) {
        x -= y;
      } else {
        y -= x;
      }
    }

    return (m * n) ~/ x;

    /// Dikalikan lalu di bagi X dan dikembalikan ke bilangan bulat.
  }
}
/// 