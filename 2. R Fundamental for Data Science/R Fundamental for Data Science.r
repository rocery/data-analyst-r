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


# Bar
#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","tahun", "jumlah_mahasiswa"))
summarybyfakultas

summarybyfakultas$tahun = as.factor(summarybyfakultas$tahun)

ggplot(summarybyfakultas, aes(x=fakultas, y=jumlah_mahasiswa)) + 
  geom_bar(stat = "identity", aes(fill = tahun), width=0.8, position = position_dodge(width=0.8)) + 
  theme_classic() 



# Pie Chart
#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","jumlah_mahasiswa"))

piechart<- ggplot(summarybyfakultas, aes(x="", y=jumlah_mahasiswa, fill=fakultas))+ geom_bar(width = 1, stat = "identity")
piechart <- piechart + coord_polar("y", start=0)
piechart <- piechart + ggtitle("Disribusi Mahasiswa per Fakultas")
piechart <- piechart + scale_fill_brewer(palette="Blues")+ theme_minimal()
piechart <- piechart + guides(fill=guide_legend(title="Fakultas"))
piechart <- piechart + ylab("Jumlah Mahasiswa") 
piechart



# Filtering
#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","tahun", "jumlah_mahasiswa"))
summarybyfakultas

summarybyfakultas$tahun = as.factor(summarybyfakultas$tahun)
summarybyfakultas[summarybyfakultas$fakultas %in% c("ICT", "Ilmu Komunikasi"),]

ggplot(summarybyfakultas[summarybyfakultas$fakultas %in% c("ICT", "Ilmu Komunikasi"),], aes(x=fakultas, y=jumlah_mahasiswa)) + 
  geom_bar(stat = "identity", aes(fill = tahun), width=0.8, position = position_dodge(width=0.8)) + 
  theme_classic() 