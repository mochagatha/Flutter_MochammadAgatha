import 'dart:io';
import 'Buku.dart';
import 'Store.dart';

void main() {
  Store store = Store();

  while (true) {
    print('\nMenu:');
    print('1. Lihat semua Buku');
    print('2. Tambah Buku');
    print('3. Hapus Buku');
    print('4. Keluar');
    print('Pilih');

    int input = int.parse(stdin.readLineSync()!);

    if (input == 1) {
      store.lihatSemuaBuku();
    } else if (input == 2) {
      print('Masukkan ID Buku:');
      int id = int.parse(stdin.readLineSync()!);

      print('Masukkan Judul Buku:');
      var judul = stdin.readLineSync();

      print('Masukkan Penerbit Buku:');
      var penerbit = stdin.readLineSync();

      print('Masukkan Harga Buku:');
      int harga = int.parse(stdin.readLineSync()!);

      print('Masukkan Kategori Buku:');
      var kategori = stdin.readLineSync();

      store.tambahBuku(Book(id, judul!, penerbit!, harga, kategori!));
    } else if (input == 3) {
      store.lihatSemuaBuku();
      if (store.books.isEmpty) {
        print('Tidak ada buku yang bisa dihapus karena daftar kosong.');
      } else {
        print('Masukkan indeks Buku yang ingin dihapus:');
        var index = int.parse(stdin.readLineSync()!);
        store.hapusBuku(index - 1);
      }
    } else if (input == 4) {
      print('Have a nice day');
      break;
    } else {
      print('Menu tidak valid.');
    }
  }
}
