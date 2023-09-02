import 'Hewan.dart';

class Mobil {
  double kapasitas = 100.0;
  List<Hewan> dataList = [
    Hewan('Sapi', 50),
    Hewan('Badak', 100),
    Hewan('Kerbau', 50),
  ];
   void tambahMuatan() {
    List<Hewan> hewanYangDiangkut = [];

    for (var hewan in dataList) {
      if (kapasitas >= hewan.berat) {
        hewanYangDiangkut.add(hewan);
        kapasitas -= hewan.berat;
      }
    }

    print('Hewan yang bisa diangkut:');
    for (var hewan in hewanYangDiangkut) {
      print('${hewan.nama}');
    }


    dataList = dataList.sublist(hewanYangDiangkut.length);
  }
}
