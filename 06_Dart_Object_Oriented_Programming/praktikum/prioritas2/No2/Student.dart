import 'Course.dart';

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void lihatSemuaCourse() {
    if (daftarCourse.isEmpty) {
      print('${nama} Belum Memiliki Course.');
    } else {
      print('Daftar Course ${nama} Adalah: ');
      for (var i = 0; i < daftarCourse.length; i++) {
        print('${i + 1}. ${daftarCourse[i].judul} - ${daftarCourse[i].deskripsi}');
      }
    }
  }

  void tambahCourse(Course course) {
    daftarCourse.add(course);
    print('Course "${course.judul}" telah ditambahkan ke daftar ${nama}.');
  }

  void hapusCourse(int index) {
    if (index >= 0 && index < daftarCourse.length) {
      print('Course "${daftarCourse[index].judul}" telah dihapus dari daftar ${nama}.');
      daftarCourse.removeAt(index);
    } else {
      print('Indeks course tidak valid.');
    }
  }
}
