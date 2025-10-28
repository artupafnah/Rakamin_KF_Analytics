-- Membuat Tabel Baru dengan Judul Tabel_Analisa di dataset Kimia_Farma
CREATE OR REPLACE TABLE Kimia_Farma.Tabel_Analisa AS (
  SELECT
    -- Memilih Kolom dari Tabel Transaksi
    t.transaction_id,
    t.date,
    t.branch_id,
    
    -- Memilih Kolom dari Tabel Cabang
    c.branch_name,
    c.kota,
    c.provinsi,

    -- ... (kolom lainnya) ...

    -- 1. Menghitung Persentase Gross Laba Sesuai dengan Ketentuan
    CASE
      WHEN t.price <= 50000 THEN 0.10 -- Laba 10% untuk harga <= 50rb
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15 -- Laba 15% untuk harga 50rb-100rb
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20 -- Laba 20% dst.
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      WHEN t.price > 500000 THEN 0.30
    END AS persentase_gross_laba,

    -- 2. Menghitung Nett Sales (Nett Sales : Harga setelah diskon)
    (t.price * (1 - t.discount_percentage)) AS nett_sales,

    -- 3. Menghitung Nett Profit (Nett Profit : Keuntungan yang diperoleh Kimia Farma) (Nett Sales * Persentase Laba)
    (t.price * (1 - t.discount_percentage)) * (
      CASE
        WHEN t.price <= 50000 THEN 0.10
      END
    ) AS nett_profit

  -- Menentukan Tabel Utama (tabel transaksi)
  FROM
    `Kimia_Farma.kf_final_transaction` AS t
  -- Menggabungkan dengan Tabel Cabang Menggunakan branch_id
  LEFT JOIN
    `Kimia_Farma.kf_kantor_cabang` AS c ON t.branch_id = c.branch_id
  -- Menggabungkan dengan Tabel Produk menggunakan Product_id
  LEFT JOIN
    `Kimia_Farma.kf_product` AS p ON t.product_id = p.product_id
);