HOW TO INSTALL THIS WEB
---

1. Salin semua file di folder `src` ke web service
2. Jangan lupa import file database di dalam folder `db`
3. Atur konfigurasi di file-file `php` berikut:
   a. Untuk file `index.php`
      - Ganti definisi konstanta `HOME_URL` menjadi alamat utama dari web
   b. Untuk file `sistem\configuration.php`
      - Ganti pengaturan untuk koneksi ke database:
        Nama database    : $sas['mysql']['database']
        Nama host        : $sas['mysql']['host']
        Username         : $sas['mysql']['username']
        Password         : $sas['mysql']['password']
4. Atur konfigurasi di file javascript berikut:
   a. Untuk file `assets\ajax_generic.js`
      - Ganti variabel `BASE_URL` menjadi alamat utama dari web, sama seperti HOME_URL pada file `index.php`
5. Jika error, gunakan konvensi berikut ini:
   - Nama Database : `tugas_wbd1`
   - Username DB   : `root`
   - Password DB   : `` (Kosongkan saja)
   - URL utama web : `http://localhost/tugas_wbd1/`