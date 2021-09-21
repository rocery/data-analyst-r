fakultas <- c("Bisnis", "D3 Perhotelan", "ICT", "Ilmu Komunikasi", "Seni dan Desain")
jumlah_mahasiswa <- c(260, 28, 284, 465, 735)
akreditasi <- c("A","A","B","A","A")

info_mahasiswa <- data.frame(fakultas, jumlah_mahasiswa, akreditasi)
info_mahasiswa

#Menggunakan package ggplot2
library("ggplot2")
#Membuat kanvas
gambar <- ggplot(info_mahasiswa, aes(x = fakultas, y = jumlah_mahasiswa, fill = fakultas))
#Menambahkan objek bar chart, simpan kembali sebagai variable gambar
gambar <- gambar + geom_bar(width = 1, stat = "identity")
#Menambahkan judul grafik
gambar <- gambar + ggtitle("Jumlah Mahasiswa per Fakultas")
#Menambahkan caption pada sumbu x
gambar <- gambar + xlab("Nama Fakultas")
#Menambahkan caption pada sumbu y
gambar <- gambar + ylab("jumlah_mahasiswa")
#Menggambar grafik
gambar



# membuka file xlsx
#Menggunakan package ggplot2
library(ggplot2)
#Menggunakan package openxlsx
library(openxlsx)
#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://storage.googleapis.com/dqlab-dataset/mahasiswa.xlsx", sheet = "Sheet 1")
#Menampilkan data
print(mahasiswa)
#Menampilkan kolom Prodi
print(mahasiswa$Prodi)
#Membuat kanvas
gambar <- ggplot(mahasiswa, aes(x=Fakultas, y=JUMLAH, fill=Fakultas))
#Menambahkan objek bar chart, simpan kembali sebagai variable gambar
gambar <- gambar + geom_bar(width=1, stat="identity")
#Menggambar grafik
gambar