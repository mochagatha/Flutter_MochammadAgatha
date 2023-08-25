
void main()async {
  List<List<dynamic>> dataList = [
    ['Agatha', 20],
    ['Latifah', 21],
    ['Rokky', 28],
  ];

  Map<String, int> dataMap = {}; ///data kosong untuk nanti di isi

  for (var data in dataList) {
    if (data.length == 2) { /// Membandingkan apakah data.length berisikan 2 data atau tidak jika iya akan di eksekusi
      dataMap[data[0]] = data[1];///nama adalah key dan umur adalah value
    }
  }
  print(dataMap);

  print("\n \n========================Soal Prioritas2 No. 2========================");
  List<int> dataNilai = [7, 5, 3, 5, 2, 1];
  int hasilRatarata = hitungRataRata(dataNilai);
  print(hasilRatarata);

print("\n \n========================Soal Prioritas2 No. 3========================");
    int input = 5;
  BigInt hasilFaktorial = await hitungFaktorial(input);
  print(hasilFaktorial);
}


int hitungRataRata(List<int> data) { ///function yang berisi data int 
  int total = data.reduce((value, element) => value + element); ///Menambahkan semua yang ada di data inputan.
  double rataRata = total / data.length; ///penjumlahan semua bilangan dibagi jumlah bilangan yang ada.
  int pembulatan = rataRata.ceil(); /// Membulatkan data yang telah di hitung
  return pembulatan;
}

Future<BigInt> hitungFaktorial(int nilai) async {
  BigInt hasil = BigInt.one; ///memulai operasi perkalian dengan nilai awal 1
  for (int i = 1; i <= nilai; i++) {
    hasil *= BigInt.from(i); ///mengalikan nilai yang ada di variabel hasil dengan nilai yang ada di (i)
  }
  return hasil;
}


