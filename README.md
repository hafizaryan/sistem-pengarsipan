# Sistem Pengarsipan

Aplikasi pengarsipan berbasis web untuk mengelola surat masuk dan surat keluar pada sebuah instansi, lengkap dengan agenda, disposisi, galeri berkas surat, dan pencetakan dokumen. Aplikasi ditulis dengan PHP native dan database MySQL.

## Fitur

- Login pengguna dengan level admin, serta pengelolaan data pengguna dan tipe pengguna
- Surat masuk: tambah, ubah, hapus, daftar transaksi, dan agenda surat masuk
- Surat keluar: tambah, ubah, hapus, daftar transaksi, dan agenda surat keluar
- Disposisi surat: tambah, ubah, hapus, dan cetak lembar disposisi
- Galeri berkas surat masuk dan surat keluar (unggahan dibatasi pada format gambar dan dokumen tertentu)
- Pengelolaan klasifikasi arsip dan referensi
- Profil instansi dan pengaturan aplikasi (pengaturan umum, basis data, dan templat)
- Backup database ke berkas SQL dan restore database dari berkas SQL
- Halaman profil pengguna

## Teknologi

- PHP native dengan MySQLi
- MySQL atau MariaDB (database `arsip`)
- HTML, CSS, dan JavaScript, dengan aset pada folder `asset`

## Struktur Proyek

```text
sistem-pengarsipan/
├── index.php              # Halaman login dan pintu masuk aplikasi
├── admin.php              # Halaman utama panel admin
├── transaksi_surat_masuk.php, agenda_surat_masuk.php,
│   tambah_surat_masuk.php, edit_surat_masuk.php,
│   hapus_surat_masuk.php, galeri_sm.php, file_sm.php
├── transaksi_surat_keluar.php, agenda_surat_keluar.php,
│   tambah_surat_keluar.php, edit_surat_keluar.php,
│   hapus_surat_keluar.php, galeri_sk.php, file_sk.php
├── disposisi.php, tambah_disposisi.php, edit_disposisi.php,
│   hapus_disposisi.php, cetak_disposisi.php
├── referensi.php, upload_referensi.php
├── user.php, tambah_user.php, edit_tipe_user.php, hapus_user.php
├── pengaturan.php, profil.php, backup.php, restore.php
├── include/               # config.php, functions.php, head, header,
│                          # menu, dan footer
├── database/arsip.sql     # Skema database
├── upload/                # Folder berkas surat yang diunggah
└── backup/                # Folder hasil backup database
```

Basis data memiliki tabel utama `tbl_surat_masuk`, `tbl_surat_keluar`, `tbl_disposisi`, `tbl_klasifikasi`, `tbl_user`, `tbl_instansi`, dan `tbl_sett`.

## Cara Menjalankan

Prasyarat: server lokal seperti XAMPP dengan Apache dan MySQL.

1. Salin folder proyek ke dalam `htdocs`.
2. Buat database bernama `arsip`, lalu impor berkas `database/arsip.sql`.
3. Sesuaikan konfigurasi koneksi pada `include/config.php` bila perlu.
4. Buka `http://localhost/sistem-pengarsipan/` di browser dan masuk dengan akun awal yang tercantum pada berkas `Baca Dulu.txt`. Demi keamanan, segera ganti password akun tersebut setelah login pertama.
