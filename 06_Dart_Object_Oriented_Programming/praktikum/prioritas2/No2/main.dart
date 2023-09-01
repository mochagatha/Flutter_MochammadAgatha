import 'dart:io';

import 'Course.dart';
import 'Student.dart';

void main() {
  Student student = Student('Agatha', 'Flutter B');

  while (true) {
    print('\nMenu:');
    print('1. Lihat semua course');
    print('2. Tambah course');
    print('3. Hapus course');
    print('4. Keluar');
    print('Pilih : ');

    var input = int.parse(stdin.readLineSync()!);

    if (input == 1) {
      student.lihatSemuaCourse();
    } else if (input == 2) {
      print('Masukkan judul course:');
      var judul = stdin.readLineSync();

      print('Masukkan deskripsi course:');
      var deskripsi = stdin.readLineSync();

      student.tambahCourse(Course(judul!, deskripsi!));
    } else if (input == 3) {
      student.lihatSemuaCourse();
      if (student.daftarCourse.isEmpty) {
        print('Tidak ada course yang bisa dihapus karena daftar kosong.');
      } else {
        print('Masukkan indeks course yang ingin dihapus:');
        var index = int.parse(stdin.readLineSync()!);
        student.hapusCourse(index - 1);
      }
    } else if (input == 4) {
      print('Have a nice day');
      break;
    } else {
      print('Menu tidak valid.');
    }
  }
}
