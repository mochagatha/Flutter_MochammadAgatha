# MVVM Architecture
- Memisahkan logic dengan tampilan (View) ke dalam ViewModel

# Keunggulan
- Jika ada beberapa tampilan yang memerlukan alur logic yang sama mereka bisa menggunakan ViewModel yang sama
- Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
- Pengujian menjadi terpisah antara penguji tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian.

# Struktur Direktori
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut.
- Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel

# Model
- Bentuk data yang akan digunakan dibuat dalam bentuk class
- Data-data yang dimuat, diletakkan pada property

# ViewModel
- Menyimpan data-data dan Logic aplikasi
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

# View
- Ui aplikasi