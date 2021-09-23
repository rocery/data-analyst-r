#Membaca dataset dengan read.csv dan dimasukkan ke variable data_intro
data_intro <- read.csv("https://storage.googleapis.com/dqlab-dataset/data_intro.csv", sep = ";")
data_intro

## mengubah data menjadi karakter karena tidak dilakukan analisis statistik pada variabel ID Pelanggan dan nama
data_intro$ID.Pelanggan <- as.character(data_intro$ID.Pelanggan)
data_intro$Nama <- as.character(data_intro$Nama)
## melihat apakah sudah berhasil dalam mengubah variabel tersebut
str(data_intro$ID.Pelanggan)
str(data_intro$Nama)

# Merubah data kualitatif menjadi factor
data_intro$Jenis.Kelamin <- as.factor(data_intro$Jenis.Kelamin)
data_intro$Tipe.Produk <- as.factor(data_intro$Tipe.Produk)
data_intro$Tingkat.Kepuasan <- as.factor(data_intro$Tingkat.Kepuasan)

# Library untuk modus, median, mean
library(pracma)

# Mode/Modus
# Mode pada produk
Mode(data_intro$Produk)
# Mode pada tingkat kepuasan
Mode(data_intro$Tingkat.Kepuasan)

# Median
## carilah median untuk kolom Pendapatan dari variable data_intro
median(data_intro$Pendapatan)
## carilah median untuk  kolom Harga dari variable data_intro
median(data_intro$Harga)
## carilah median untuk kolom Jumlah dari variable data_intro
median(data_intro$Jumlah)
## carilah median untuk  kolom Total dari variable data_intro
median(data_intro$Total)

# Mean/rata-rata
## carilah mean untuk kolom Pendapatan pada variable data_intro
mean(data_intro$Pendapatan)
## carilah mean untuk kolom Harga pada variable data_intro
mean(data_intro$Harga)
## carilah mean untuk kolom Jumlah pada variable data_intro
mean(data_intro$Jumlah)
## carilah mean untuk kolom Total pada variable data_intro
mean(data_intro$Total)

# Mencari range dari pendapatan
max(data_intro$Pendapatan) - min(data_intro$Pendapatan)

# Mencari varians dari pendapatan
var(data_intro$Pendapatan)

# Mencari standar deviasi dari pendapatan
sd(data_intro$Pendapatan)

# ---------------Analisis Deskriptif pada variable data_intro-----------------
# Summary dari data_intro
summary(data_intro)

# Visualisasi -> Plot == Factor, Hist == Int/Numerik
plot(data_intro$Jenis.Kelamin)
hist(data_intro$Pendapatan)
plot(data_intro$Produk)
hist(data_intro$Harga)
hist(data_intro$Jumlah)
hist(data_intro$Total)
plot(data_intro$Tingkat.Kepuasan)

# Analisis Data Sederhana
# Mencari korelasi menggunakan scatter plot
plot(data_intro$Pendapatan,data_intro$Total)
# Mencari korelasi menggunakan fungsi cor.test() - Numerik dan numerik
cor.test(data_intro$Pendapatan, data_intro$Total)

# Numerik dan Numerik (Kategorik) chi-square
## Carilah tabulasi silang antara kolom jenis produk (Produk) dan tingkat kepuasan (Tingkat.Kepuasan) dari variable data_intro
table(data_intro$Produk, data_intro$Tingkat.Kepuasan)
## Analisis bagaimana hubungan jenis produk dengan tingkat kepuasan mengunakan uji korelasi
chisq.test(table(data_intro$Produk, data_intro$Tingkat.Kepuasan))


# Hubungan variabel Kategorik dan numerik t.test
## carilah boxplot antara variabel jenis kelamin dengan total belanja
boxplot(Total~Jenis.Kelamin, data = data_intro)
## analisis bagaimana hubungan jenis kelamin dengan total belanja mengunakan uji statistik t-test
t.test(Total~Jenis.Kelamin, data = data_intro)