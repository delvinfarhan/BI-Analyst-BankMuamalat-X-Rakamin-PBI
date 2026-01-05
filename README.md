# Big Data Analytics – Bank Muamalat x Rakamin Academy
# Analisis Kinerja Bisnis PT Sejahtera Bersama (2020–2021)

Repository ini berisi hasil pengerjaan **Final Task Virtual Internship Experience** sebagai **Business Intelligence Analyst** pada program kolaborasi **Rakamin Academy x Bank Muamalat**.

Proyek ini berfokus pada pengolahan data penjualan menggunakan **Google BigQuery** dan penyajian insight bisnis melalui **dashboard interaktif Google Looker Studio** untuk membantu pengambilan keputusan berbasis data.

---

## 📖 Tentang Program

Program Virtual Internship Experience Bank Muamalat merupakan program pembelajaran berbasis proyek yang dirancang untuk mengasah kemampuan peserta dalam bidang **Business Intelligence dan Data Analytics**, meliputi data preparation, SQL analysis, business insight, dan data visualization.

## 🎯 Tantangan Proyek (Project Challenge)

Tugas utama dalam proyek ini meliputi:

1. Menentukan **primary key** pada 4 dataset penjualan  
2. Menentukan **relationship** antar ke-4 tabel  
3. Membuat **master table** yang berisi data transaksi terintegrasi  
4. Membuat **dashboard visualisasi penjualan**  
5. Memberikan **rekomendasi bisnis** berdasarkan hasil analisis data  

## 🛠 Tools yang Digunakan

Proyek ini memanfaatkan tools berikut:

- **Google BigQuery**  
  Digunakan untuk menyimpan dataset, melakukan transformasi data, dan analisis
  menggunakan SQL.

- **Google Looker Studio**  
  Digunakan untuk membangun dashboard visualisasi penjualan secara interaktif.

- **GitHub**  
  Digunakan sebagai repositori penyimpanan query SQL, dataset hasil olahan,
  dan dokumentasi proyek.

## 🔄 Alur Kerja Proyek (Workflow)

1. **Import Dataset**  
   Dataset penjualan diunggah ke Google BigQuery.

2. **Transformasi Data (SQL)**  
   - Menentukan primary key dan foreign key  
   - Melakukan JOIN antar tabel  
   - Membuat master table transaksi penjualan  

3. **Export Data**  
   Master table diekspor ke format CSV.

4. **Visualisasi Data**  
   Data CSV digunakan sebagai sumber data untuk dashboard di Google Looker Studio.

## 📝 SQL Query: Pembuatan Master Table

Query SQL berikut digunakan untuk membentuk **tabel master transaksi penjualan** yang menggabungkan data dari tabel `orders`, `customers`, `products`, dan `product_category`.

Tabel ini berisi informasi customer, produk, kategori, quantity, dan total penjualan, serta diurutkan berdasarkan tanggal transaksi dari yang paling awal hingga paling akhir.

```sql
SELECT
  o.Date AS order_date,
  cat.CategoryName AS category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (o.Quantity * p.Price) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city

FROM
  `bank_muamalat.orders` AS o
LEFT JOIN
  `bank_muamalat.customers` AS c
  ON o.CustomerID = c.CustomerID
LEFT JOIN
  `bank_muamalat.products` AS p
  ON o.ProdNumber = p.ProdNumber
LEFT JOIN
  `bank_muamalat.product_category` AS cat
  ON p.Category = cat.CategoryID

ORDER BY
  order_date ASC;
```

## 📊 Hasil Dashboard dan Temuan Utama

Dashboard menampilkan analisis kinerja penjualan PT Sejahtera Bersama periode
2020–2021, fitur dashboard meliputi:
- **Scorecards:** Total Sales, Total Order Quantity, Average Order Value.
- **Bar Charts:** Top 5 Sales by Category, Top 5 Quantity by Category.
- **Geo Map:** Sebaran penjualan berdasarkan kota (Total Sales by City).
- **Filter Control:** Rentang tanggal, Nama Kategori, dan Kota Pelanggan.

🔗 **Link Dashboard Google Looker Studio:**  
[**https://lookerstudio.google.com/reporting/d6dc65fb-dc4a-4785-9cc8-a8ae411e5c40**](https://lookerstudio.google.com/reporting/d6dc65fb-dc4a-4785-9cc8-a8ae411e5c40)

![Image](https://github.com/user-attachments/assets/345eab10-ef54-458b-bcda-84ec1ab85ede)

**Temuan Utama (Key Findings)**

- **Total Performa**  
  Total penjualan mencapai **$1,754,751** dengan total item terjual sebanyak **11,654 item**.

- **Kategori Dominan**
  - **By Sales**:  
    Kategori **Robots** mendominasi pendapatan (**$743.5K**), diikuti oleh **Drones** (**$477.4K**).
  - **By Quantity**:  
    Kategori **eBooks** paling banyak terjual (**3,123 item**), namun kontribusi sales-nya rendah → menandakan harga per unit yang murah.

- **Analisis Wilayah**  
  Penjualan tertinggi terkonsentrasi di kota **Washington** ($55,381) dan **Houston** ($33,761), sementara wilayah lain relatif merata.


# 💡 Rekomendasi Bisnis (Actionable Insights)

Berdasarkan analisis data, berikut adalah strategi yang diusulkan:

1. **Fokus pada Kota Top Tier**  
   Tingkatkan *marketing campaign* lokal di **top 5 kota** (seperti Washington & Houston) untuk menjaga loyalitas pelanggan yang sudah tinggi.

2. **Strategi Bundling Produk**  
   Lakukan *bundling* antara produk terlaris secara kuantitas (**eBooks**) dengan produk bernilai tinggi (**Robot/Drones**) atau produk yang kurang laku untuk meningkatkan rata-rata nilai pesanan.

3. **Customer Retention**  
   Manfaatkan data `CustomerEmail` untuk mengirimkan *newsletter* atau diskon khusus kepada pelanggan yang sudah lama tidak bertransaksi untuk meningkatkan *retention rate*.


## 📑 Kesimpulan Utama

1. Penjualan terkonsentrasi pada beberapa kota dengan kontribusi terbesar terhadap revenue.  
2. Beberapa kategori memiliki volume penjualan tinggi namun nilai sales rendah.  
3. Strategi bundling produk berpotensi meningkatkan performa kategori dengan sales rendah.  
4. Program retensi pelanggan berbasis histori transaksi dapat meningkatkan loyalitas customer.
