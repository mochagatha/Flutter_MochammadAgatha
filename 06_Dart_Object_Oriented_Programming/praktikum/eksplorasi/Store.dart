import 'Buku.dart';

class Store {
  List<Book> books = [];

  void tambahBuku(Book book) {
    books.add(book);
    print('\nBuku ${book.judul} berhasil ditambahkan');
  }

  void lihatSemuaBuku() {
    if (books.isEmpty) {
      print('Tidak ada buku dalam toko.');
    } else {
      print('Daftar semua buku:');
      for (var i = 0; i < books.length; i++) {
        print(
            '${i + 1}. ID: ${books[i].id},\n   Judul Buku:${books[i].judul},\n   Penerbit Buku:${books[i].penerbit},\n   Harga Buku:${books[i].harga},\n   Kategori Buku:${books[i].kategori}');
      }
    }
  }

  void hapusBuku(int index) {
    if (index >= 0 && index < books.length) {
      print('Buku "${books[index].judul}" telah dihapus.');
      books.removeAt(index);
    } else {
      print('Indeks Buku tidak valid.');
    }
  }
}
