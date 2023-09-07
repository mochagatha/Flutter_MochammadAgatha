## Flutter Layout
Untuk mengatur tata letak dan Layout berbentuk widget yang mengatur widget di dalamnya.

# Single-child Layout
- "Container" Membuat sebuah box, Membungkus widget lain, Box memiliki margin, padding, dan border.
- "Padding" Mengganti jarak antara container dengan child.
- "Center" Membuat widget menjadi ditengah, Membuat sebuah box, Membungkus widget lain, Memenuhi lebar dan tinggi ruang di luarnya.
- "SizedBox" Membuat sebuah box, Membungkus widget lain, Box dapat diatur lebar dan tingginya, Lebih sederhana dari container.
- "Align" Memberikan posisi horizontal/vertical kepada child.

# Multi-child Layout
- "Column" Mengatur widget secara vertikal.
- "Row" Mengatur widget secara horizontal.
- "ListView" Mengatur widgets dalam bentuk list.
- "Memiliki kemampuan scroll"
- "GridView" Mengatur widget dalam betuk galeri.





## Form Input Button
# Form
- "Form" Menerima inputan data dari user, inputan data dapat lebih dari satu.

# Input 
- "TextField" Menerima inputan data dari pengguna, inputan data dapat lebih dari satu.
- "Radio" Data diambil menggunakan property dengan tipe data sesuai value pada radio.
- "Checkbox" Memberi opsi pada pengguna, Pengguna dapat memilih beberapa opsi, Data diambil menggunakan property boolean.
- "Dropdown Button" Memberi opsi pada pengguna dengan menampilkan saat diklik, Hanya dapat memilih satu opsi, Data diambil menggunakan property dengan tipe data sesuai value pada dropdown.

# Button
Bersifat seperti tombol yang dapat melakukan sesiatu saat di klik.
- "ElevatedBtton" Tombol yang timbul, Jika diklik akan menjalankan onPressed.
- "IconButton" Tombol yang hanya menampilkan icon, jika diklik akan menjalankan onPressed.
- "TextButton" Tombol berupa text, jika diklik akan menjalankan onPressed.





## Form Picker (Advance User Input)
# Date Picker
Widget dimana user bisa memasukkan Tanggal kelahiran, Waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll.
Cara membuat File picker
- Menggunakan fungsi bawaan flutter showDatePicker.
- Fungsi showDatePicker memiliki tipe data future.
- Menampilkan dialog material design date picker.
- Menambahkan packages intl.
- Membuat variable DateTime dengan nama _dueDate dan variable dengan tipe final bernama currentDate.
- Membuat UI.
- Menambahkan fungsi showDatePicker didalam onPressed.
- Memanggil fungsi setState di dalam onPressed.

# Color Picker
Widget dimana user bisa memilih warna, penggunaan color picker bisa digunakan untuk berbagai macam kendisi.
Cara membuat color picker
- Menambahkan packages flutter_colorpicker.
- Membuat variable color dengan nama variable _currentColor.
- Membuat UI.
- Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog.
- import packages flutter_colorpicker dalam file.
- Membuat code untuk penggunaan packages flutter_colorpicker.


# File Picker
Kemampuan widget untuk mengakses storage, Memilih dan membuka file.
Cara membuat File picker
- Menambahkan packages file_picker dan open_file.
- import packages file_picker dan open_file dalam file.
- Membuat UI.
- Membuat fungsi _pickFile untuk mengexplore dan memilih file dari storage.
- Memanggil fungsi yang telah kita buat sebelumnya ke onPressed.
- Membuat fungsi _openFile untuk membuka file yang telah dipilih.
- Mengambil file dari object result dan Memanggil fungsi _openFile di dalam fungsi _pickFile

