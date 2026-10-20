# Draft Konsep Normalisasi Basis Data - Toko Daring
**Nama:** Zidan Fidha B  
**NIM:** 25430091  
**Mata Kuliah:** Basis Data  

---

## **1. Dokumen Sumber (UNF - Unnormalized Form)**
Bentuk mentah data transaksi toko daring di mana seluruh atribut masih bergabung dalam satu tabel besar:

* `id_transaksi`
* `tanggal_trx`
* `id_pelanggan`
* `nama_pelanggan`
* `email_pelanggan`
* `no_telepon_pelanggan`
* `alamat_pelanggan`
* `id_produk`
* `nama_produk`
* `harga_produk`
* `qty`
* `subtotal`
* `total_harga`
* `status_trx`

---

## **2. Dependensi Fungsional (Functional Dependency)**
Ketergantungan fungsional antar atribut:

1. `id_pelanggan` $\rightarrow$ `nama_pelanggan, email_pelanggan, no_telepon_pelanggan, alamat_pelanggan`
2. `id_produk` $\rightarrow$ `nama_produk, harga_produk`
3. `id_transaksi` $\rightarrow$ `tanggal_trx, total_harga, status_trx, id_pelanggan`
4. `(id_transaksi, id_produk)` $\rightarrow$ `qty, subtotal`

---

## **3. Tahapan Normalisasi**

### **a. 1NF (First Normal Form)**
Menghilangkan kelompok terulang (*repeating groups*) dan memastikan setiap kolom memiliki nilai atomik.

### **b. 2NF (Second Normal Form)**
Menghilangkan ketergantungan parsial (*partial dependency*) dengan memisahkan entitas utama:
* **Tabel Pelanggan:** `id_pelanggan` (PK), `nama_pelanggan`, `email_pelanggan`, `no_telepon_pelanggan`, `alamat_pelanggan`
* **Tabel Produk:** `id_produk` (PK), `nama_produk`, `harga_produk`
* **Tabel Transaksi Header:** `id_transaksi` (PK), `tanggal_trx`, `total_harga`, `status_trx`, `id_pelanggan` (FK)

### **c. 3NF (Third Normal Form)**
Menghilangkan ketergantungan transitif (*transitive dependency*):
* **Tabel Detail Transaksi:** `id_detail` (PK), `id_transaksi` (FK), `id_produk` (FK), `qty`, `subtotal`

### **d. Pemeriksaan BCNF (Boyce-Codd Normal Form)**
Seluruh penentu (*determinant*) dalam skema relasi di atas sudah merupakan *Candidate Key* / *Primary Key*, sehingga skema telah memenuhi standar BCNF.

---

## **4. Keputusan Atribut Turunan (Derived Attribute)**
Atribut `subtotal` dan `total_harga` **tetap disimpan** di dalam basis data untuk meningkatkan performa pembacaan laporan (*query performance*) tanpa harus selalu menghitung ulang secara kuantitatif pada ribuan baris transaksi.