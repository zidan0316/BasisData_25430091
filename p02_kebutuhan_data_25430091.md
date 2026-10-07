# Dokumen Kebutuhan Data: Toko Daring (Milestone Proyek 2)
* **Nama Proyek:** Toko Daring
* **NIM:** 25430091
* **Nama Pengembang:** Zidan Fidha B

---

## 1. Proses Bisnis (Minimal 4 Proses)
1. **Pendaftaran dan Autentikasi Anggota:** Pengguna mendaftar dengan mengisi data diri (nama, email, kata sandi, nomor HP) untuk mendapatkan akun pelanggan, kemudian melakukan login ke sistem.
2. **Pencarian dan Pengelolaan Keranjang:** Pelanggan mencari produk berdasarkan kategori, melihat detail produk, lalu memasukkan produk pilihan ke dalam keranjang belanja.
3. **Proses Checkout dan Pembayaran:** Pelanggan memilih alamat pengiriman, menentukan metode pembayaran, dan melakukan *checkout* untuk menghasilkan pesanan baru.
4. **Pengelolaan Stok oleh Admin:** Admin mengelola data produk, memantau ketersediaan stok, serta memperbarui status pengiriman pesanan yang telah dibayar.

---

## 2. Entitas Kandidat (Minimal 6 Entitas)
1. `Pelanggan`: Menyimpan informasi profil data diri pembeli/anggota.
2. `Kategori`: Menyimpan pengelompokan jenis produk (misal: Elektronik, Pakaian, dll).
3. `Produk`: Menyimpan data barang yang dijual beserta harga dan stok.
4. `Keranjang`: Menyimpan daftar produk sementara yang dipilih oleh pelanggan sebelum dibeli.
5. `Transaksi`: Menyimpan data utama pesanan (tanggal, total harga, status pembayaran).
6. `Detail_Transaksi`: Menyimpan rincian produk apa saja yang dibeli pada setiap nomor transaksi.

---

## 3. Aturan Bisnis (Minimal 8 Aturan)
* **AB-01:** Setiap pelanggan wajib memiliki alamat email yang unik sebagai identitas akun.
* **AB-02:** Stok produk di basis data akan otomatis berkurang ketika transaksi pembayaran berhasil divalidasi.
* **AB-03:** Pelanggan tidak dapat melakukan *checkout* jika kuantitas produk yang diminta melebihi sisa stok yang tersedia.
* **AB-04:** Setiap kelipatan belanja Rp10.000 bernilai 1 poin loyalitas bagi anggota.
* **AB-05:** Anggota dapat menukarkan 50 poin loyalitas untuk mendapatkan potongan diskon senilai Rp5.000.
* **AB-06:** Status pesanan awal setelah *checkout* adalah "Menunggu Pembayaran".
* **AB-07:** Admin berhak menambah, mengubah, atau menghapus data produk dari katalog toko.
* **AB-08:** Kata sandi pelanggan wajib dienkripsi (*hashing*) di dalam basis data demi keamanan privasi.

---

## 4. Kebutuhan Informasi (Minimal 5 Laporan)
1. **Laporan Penjualan Bulanan:** Menampilkan total pendapatan dan jumlah transaksi per bulan.
2. **Laporan Stok Menipis:** Menampilkan daftar produk yang memiliki sisa stok di bawah batas minimum (di bawah 5 pcs).
3. **Laporan Riwayat Belanja Pelanggan:** Menampilkan daftar transaksi yang pernah dilakukan oleh seorang pelanggan tertentu.
4. **Laporan Poin Loyalitas:** Menampilkan akumulasi poin dan riwayat penukaran poin anggota.
5. **Laporan Produk Terlaris:** Menampilkan daftar barang dengan jumlah terjual terbanyak dalam periode tertentu.

---

## 5. Matriks CRUD (Create, Read, Update, Delete)

| Proses Bisnis | Pelanggan | Kategori | Produk | Keranjang | Transaksi | Detail_Transaksi |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| 1. Pendaftaran & Login | C, R, U | - | - | - | - | - |
| 2. Pencarian & Keranjang | - | R | R | C, R, U, D | - | - |
| 3. Checkout & Pembayaran | R | - | U | R, D | C, R, U | C |
| 4. Pengelolaan Stok Admin| - | C, R, U, D| C, R, U, D| - | R, U | R |

---

## 6. Kamus Data Awal (Minimal 20 Elemen)

| No | Nama Elemen Data | Tipe Data | Panjang | Keterangan / Aturan | Penanggung Jawab |
|:---|:---|:---|:---|:---|:---|
| 1 | `id_pelanggan` | INT | 11 | Primary Key, Auto Increment | Admin Sistem |
| 2 | `nama_lengkap` | VARCHAR | 100 | Nama identitas asli pelanggan | Pelanggan |
| 3 | `email` | VARCHAR | 100 | Unik, untuk login dan notifikasi | Pelanggan |
| 4 | `kata_sandi` | VARCHAR | 255 | Disimpan dalam bentuk hash terenkripsi | Sistem Keamanan |
| 5 | `no_telepon` | VARCHAR | 15 | Nomor kontak aktif pelanggan | Pelanggan |
| 6 | `alamat` | TEXT | - | Alamat lengkap tujuan pengiriman | Pelanggan |
| 7 | `id_kategori` | INT | 11 | Primary Key tabel kategori | Admin Katalog |
| 8 | `nama_kategori` | VARCHAR | 50 | Contoh: Elektronik, Fashion, dll | Admin Katalog |
| 9 | `id_produk` | INT | 11 | Primary Key tabel produk | Admin Katalog |
| 10 | `nama_produk` | VARCHAR | 150 | Nama barang yang dijual | Admin Katalog |
| 11 | `harga_produk` | DECIMAL | 10,2 | Harga satuan dalam Rupiah | Admin Keuangan |
| 12 | `stok_produk` | INT | 11 | Jumlah ketersediaan barang di gudang | Admin Gudang |
| 13 | `id_keranjang` | INT | 11 | Primary Key tabel keranjang | Sistem |
| 14 | `qty_keranjang`| INT | 11 | Jumlah barang yang dimasukkan ke keranjang| Pelanggan |
| 15 | `id_transaksi` | INT | 11 | Primary Key tabel transaksi | Sistem Pembayaran |
| 16 | `tanggal_trx`  | DATETIME | - | Waktu saat transaksi dibuat | Sistem |
| 17 | `total_harga`  | DECIMAL | 10,2 | Akumulasi total pembayaran pesanan | Sistem Pembayaran|
| 18 | `status_trx`   | VARCHAR | 30 | Pending / Lunas / Dikirim / Selesai | Admin Pengiriman|
| 19 | `id_detail`    | INT | 11 | Primary Key detail transaksi | Sistem |
| 20 | `poin_loyalitas`| INT | 11 | Saldo poin reward milik anggota | Admin Member |

---

## 7. Kebutuhan Non-Fungsional (Keamanan & Privasi)
* **Kerahasiaan Data Pribadi:** Data sensitif seperti kata sandi wajib di-hash menggunakan algoritma enkripsi modern (seperti Bcrypt). Data nomor telepon dan alamat hanya boleh diakses oleh pemilik akun dan admin yang berwenang.
* **Ketersediaan & Performa:** Sistem basis data harus dapat diakses secara *online* selama 24/7 dengan waktu respon kueri pencarian produk kurang dari 2 detik.
* **Otorisasi Akses:** Hak akses dibagi menjadi dua peran utama, yaitu **Pelanggan** (hanya dapat melihat katalog dan mengelola keranjang/pesanan sendiri) serta **Admin** (memiliki hak penuh mengelola data produk, kategori, dan memvalidasi transaksi).

---

## 8. Dokumen Sumber Fiktif (Contoh Nota Penjualan)

Berikut adalah rancangan format dokumen sumber fiktif berupa **Nota Struk Pembelian** yang dihasilkan oleh sistem:

```text
==================================================
                 TOKO DARING 091                  
      Jl. Telekomunikasi No. 1, Bandar Lampung    
==================================================
No. Transaksi : TRX/20261007/001                  
Tanggal       : 07 Oktober 2026                   
Pelanggan     : Budi Santoso (budi@email.com)     
--------------------------------------------------
Nama Produk         Qty    Harga Satuan    Subtotal
--------------------------------------------------
Kemeja Flanel        1     Rp 150.000     Rp 150.000
Sepatu Sneakers      1     Rp 350.000     Rp 350.000
--------------------------------------------------
Total Belanja                            Rp 500.000
Diskon Poin (50 Poin)                    - Rp  5.000
--------------------------------------------------
TOTAL PEMBAYARAN                         Rp 495.000
Metode Pembayaran : Transfer Bank (Lunas)         
==================================================
        Terima Kasih Telah Berbelanja!            
==================================================