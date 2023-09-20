## Assets
- File yang di bundled di deployed bersamaan dengan aplikasi.
- Tipe-tipe asset seperti: static data(JSON files), icons, images, dan font(ttf).
- Menggunakan pubspec.yaml untuk mengaktifkan assets

# Image
- Image atau gambar akan membuat tampilan aplikasi menjadi lenih menarik.
- Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, BMP, dan WBMP.
- Menampilkan gambar dari project assets dan internet.

# Images Assets
- Membutuhkan properti Image.asset contohnya seperti berikut:
Image.asset(
    "assets/icon/icon.png",
    width: 120.0,
    height: 120.0,
    fit: BoxFit.fill,
),

# Images Network
- Membutuhkan properti Image.network contohnya seperti berikut:
Image.network(
    "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
    width: 200.0,
    height: 200.0,
    fit: BoxFit.cover,
),

## Font 
- Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi.
- Penentuan font yang mau dipakai biasanya oleh UI disigner.
- Penerapan font menggunakan custom font atau dari package.

# Cara menggunakan custom font di flutter
- Cari dan download font di https://fonts.google.com/.
- Import file .ttf.
- Daftarkan font di pubspec.yaml.
- Mengatur font sebagai default.
- Gunakan font di spesifik widget.

# Cara menggunakan custom font di flutter menggunakan Google_fonts
- Tambahkan package google_fonts di dependencies.
- Import package di file dart.
- Gunakan font dengan memanggil GoogleFonts.namaFont().