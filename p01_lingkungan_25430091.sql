-- Berkas: p01_lingkungan_25430091.sql
-- Praktikan: ZIDAN FIDHA BRILLIANS (NPM: 25430091)

-- 1. Membuat Basis Data Praktik (Kopma/Toko Latihan)
CREATE DATABASE IF NOT EXISTS toko_091
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

-- 2. Membuat Akun Utama Praktik (mhs_091)
CREATE USER IF NOT EXISTS 'mhs_091'@'localhost' IDENTIFIED BY 'DanfiMysql#2026';
GRANT ALL PRIVILEGES ON toko_091.* TO 'mhs_091'@'localhost';

-- 3. Membuat Akun Tamu untuk Latihan Hak Akses (tamu_091)
CREATE USER IF NOT EXISTS 'tamu_091'@'localhost' IDENTIFIED BY 'PasswordTamu#091';
GRANT SELECT ON toko_091.* TO 'tamu_091'@'localhost';

-- 4. Membuat Basis Data Proyek Utama (Toko Daring)
CREATE DATABASE IF NOT EXISTS toko_daring_091
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

-- 5. Membuat Akun Developer Proyek (dev_091)
CREATE USER IF NOT EXISTS 'dev_091'@'localhost' IDENTIFIED BY 'PasswordDev#091';
GRANT ALL PRIVILEGES ON toko_daring_091.* TO 'dev_091'@'localhost';

-- 6. Memperbarui Hak Akses Server
FLUSH PRIVILEGES;