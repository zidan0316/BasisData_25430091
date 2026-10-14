-- Buat database jika belum ada
CREATE DATABASE IF NOT EXISTS toko_daring_25430091;
USE toko_daring_25430091;

-- 1. TABEL PELANGGAN
CREATE TABLE pelanggan (
    id_pelanggan INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_lengkap VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    kata_sandi VARCHAR(255) NOT NULL,
    no_telepon VARCHAR(15) NOT NULL,
    alamat TEXT NOT NULL,
    poin_loyalitas INT(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. TABEL KATEGORI
CREATE TABLE kategori (
    id_kategori INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. TABEL PRODUK
CREATE TABLE produk (
    id_produk INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(150) NOT NULL,
    harga_produk DECIMAL(10,2) NOT NULL,
    stok_produk INT(11) NOT NULL,
    id_kategori INT(11) NOT NULL,
    CONSTRAINT fk_produk_kategori FOREIGN KEY (id_kategori) 
        REFERENCES kategori(id_kategori) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. TABEL KERANJANG
CREATE TABLE keranjang (
    id_keranjang INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT(11) NOT NULL,
    id_produk INT(11) NOT NULL,
    qty_keranjang INT(11) NOT NULL,
    CONSTRAINT fk_keranjang_pelanggan FOREIGN KEY (id_pelanggan) 
        REFERENCES pelanggan(id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_keranjang_produk FOREIGN KEY (id_produk) 
        REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. TABEL TRANSAKSI
CREATE TABLE transaksi (
    id_transaksi INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal_trx DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_harga DECIMAL(10,2) NOT NULL,
    status_trx VARCHAR(30) NOT NULL DEFAULT 'Menunggu Pembayaran',
    id_pelanggan INT(11) NOT NULL,
    CONSTRAINT fk_transaksi_pelanggan FOREIGN KEY (id_pelanggan) 
        REFERENCES pelanggan(id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. TABEL DETAIL_TRANSAKSI
CREATE TABLE detail_transaksi (
    id_detail INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT(11) NOT NULL,
    id_produk INT(11) NOT NULL,
    qty INT(11) NOT NULL,
    harga_satuan DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detail_transaksi FOREIGN KEY (id_transaksi) 
        REFERENCES transaksi(id_transaksi) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detail_produk FOREIGN KEY (id_produk) 
        REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;