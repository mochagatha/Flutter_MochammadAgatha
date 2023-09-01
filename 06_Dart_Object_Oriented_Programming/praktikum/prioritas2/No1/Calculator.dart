class Calculator {
  int bilanganA = 100;
  int bilanganB = 10;

  int penjumlahan() {
    int hasilPenjumlahan = bilanganA + bilanganB;
    return hasilPenjumlahan;
  }

  int pengurangan() {
    int hasilPengurangan = bilanganA - bilanganB;
    return hasilPengurangan;
  }

  int perkalian() {
    int hasilPerkalian = bilanganA * bilanganB;
    return hasilPerkalian;
  }

  double pembagian() {
    if (bilanganB == 0) {
      print('\nPembagian 0 tidak ada hasil');
      return 0;
    } else {
      double hasilPembagian = bilanganA / bilanganB;
      return hasilPembagian;
    }
  }
}
