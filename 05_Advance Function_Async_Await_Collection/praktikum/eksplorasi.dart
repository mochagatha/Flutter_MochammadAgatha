void main() {
  List<String> inputList = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];

  List<String> uniqueList = inputList.toSet().toList(); /// .toSet() Melihat apakah ada duplikat, lalu di buat list baru menggunakan .toList()

  print(uniqueList);

  print("\n\n========================Soal Eksplorasi No. 2========================");
  List<String> listPemrograman = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust',
  ];

  Map<String, int> jumlah = {};

  for (String data in listPemrograman) {
    if (jumlah.containsKey(data)) {
      jumlah[data] = jumlah[data]! + 1; ///melakukan cek apakah data ini duplikat jika duplikat akan di tambahkan 1
    } else {
      jumlah[data] = 1;
    }
  }

  jumlah.forEach((key, value) { /// memasangkan key dan value yang sudah di jalankan di for
    print('$key: $value');
  });
}
