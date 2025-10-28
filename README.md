# Proyek Analisis Kinerja Bisnis Kimia Farma Tahun 2020-2023

Proyek ini merupakan _Project-Based Internship_ dari Rakamin Academy dan Kimia Farma, di mana saya berperan sebagai Big Data Analytics Intern.

Tujuan dari proyek ini adalah untuk menganalisis kinerja bisnis Kimia Farma dari tahun 2020-2023 dengan mengolah data mentah menjadi dashboard analitik.

---

## Workflow (Alur Pengerjaan)

Proyek ini diselesaikan melalui 4 tahapan utama:

### 1. Persiapan Google Cloud (BigQuery)
* Membuat proyek baru di Google Cloud Platform dengan nama: `Rakamin-KF-Analytics`.
* Membuat dataset baru di dalam proyek tersebut dengan nama: `kimia_farma`.

### 2. Pengunggahan Data (Data Ingestion)
* Mengunggah 4 file CSV yang disediakan ke dalam dataset `kimia_farma`:
    * `kf_final_transaction.csv`
    * `kf_inventory.csv`
    * `kf_kantor_cabang.csv`
    * `kf_product.csv`

### 3. Transformasi Data (SQL)
* Menjalankan query SQL (file `buat_tabel_analisa.sql` di repository ini) untuk membuat satu tabel analisa utama bernama `Tabel_Analisa`.
* Query ini menggabungkan data dari 3 tabel (transaksi, kantor cabang, dan produk).
* Query ini juga menghitung kolom-kolom baru yang diwajibkan, seperti `persentase_gross_laba`, `nett_sales`, dan `nett_profit`.

### 4. Visualisasi Data (Dashboard)
* Menghubungkan `Tabel_Analisa` dari BigQuery ke Google Looker Studio.
* Membuat dashboard interaktif untuk memvisualisasikan data sesuai dengan kebutuhan proyek (misalnya, perbandingan pendapatan tahunan, top 10 provinsi, geo map profit, dll).

---

## Isi Repository
* **`/buat_tabel_analisa.sql`**: Berisi _syntax_ BigQuery SQL yang digunakan untuk membuat `Tabel_Analisa` (tahap 3).
