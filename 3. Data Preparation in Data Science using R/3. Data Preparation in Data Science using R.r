# -------------------------------------Missing Value in R---------------------------------------
#Ketik nilai NA
NA
#Tampilkan type dari NA dengan function typeof
typeof(NA)

#Buat variable x yang diisi dengan nilai NA
x <- NA
#Pengecekan variable x dengan nilai NA menggunakan operator ==
x == NA

#Pengecekan variable x dengan nilai NA menggunakan function is.na
is.na(x)

typeof(NA_integer_)
typeof(NA_real_)
typeof(NA_complex_)
typeof(NA_character_)
is.na(NA_integer_)
is.na(NA_real_)
is.na(NA_complex_)
is.na(NA_character_)

#Membuat vector bernama isi.vector dengan isi bilangan, dimana salah satunya memiliki missing value
isi_vector <- c(1, 2, 3, NA, 3, 1)

#Mengecek keseluruhan tipe data dengan perulangan lapply dan typeof
lapply(isi_vector, typeof)

# Menggunakan is.na untuk mengecek keberadaan
# missing value dari tiap elemen pada vector
is.na(isi_vector)

# NA dan NULL
#Membuat vector dengan 7 elemen termasuk NA dan NULL
isi.vector <- c(1, 2, 3, NA, 5, NULL, 7)
#Menghitung jumlah elemen dari isi.vector
length(isi.vector)

# NULL dan list
#Membuat list dengan 3 elemen termasuk NA dan NULL
isi.list <- list(1, NULL, 3, NA, 5)
#Menghitung jumlah elemen dari isi.list
length(isi.list)

# Menghitung Jumlah Missing Values dari satu Vector
isi.vector <- c(1, 2, NA, 4, 5, NaN, 6)
sum(is.na(isi.vector) == TRUE)



# ---------------------Factor-------------------------
#Buatlah factor dengan isi nilai teks "Jan", "Feb", dan "Mar"
faktor.bulan <- factor(c("Jan", "Feb", "Mar"))
# Melihat atibut dari variabel
attributes(faktor.bulan)
# Melihat levels dan class pada sebuah variabel
levels(faktor.bulan)
class(faktor.bulan)
# Melihat index pada factor
as.integer(factor.bulan)
#Mengganti levels 
levels(factor.bulan)[2] <- "Januari"
levels(factor.bulan)[3] <- "Maret"
# Menghitung panjang factor
length(factor.bulan)

# ----------------Reading from Text and Excel File----------------------
#Membaca dataset dengan read.csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")
# Membaca file TSV
penduduk.dki2 <- read.csv("dkikepadatankelurahan2013.tsv", sep = "\t")
library(openxlsx)
#Membaca dataset dengan read.xlsx dan dimasukkan ke variable penduduk.dki
penduduk.dki.xlsx <- read.xlsx(xlsxFile = "dkikepadatankelurahan2013.xlsx")

penduduk.dki
# Profile dataset
str(penduduk.dki)
summary(penduduk.dki)
# Melihat nama kolom
names(penduduk.dki.csv)
# Merubah nama kolom
names(penduduk.dki.csv)[1] <- "PERIODE"
# Merubah beberapa nama kolom
names(penduduk.dki.csv)[c(1:2)] <- c("PERIODE", "PROPINSI")
# Merubah tipe kolom menjadi factor
penduduk.dki.xlsx$NAMA.PROVINSI <- as.factor(penduduk.dki.xlsx$NAMA.PROVINSI)
#Tampilkan nama-nama kolom yang mengandung kata "perempuan".
pola_nama_perempuan <- grep(pattern = "perempuan", x = names(penduduk.dki.xlsx), ignore.case = TRUE)
names(penduduk.dki.xlsx[pola_nama_perempuan])
#Tampilkan nama-nama kolom yang mengandung kata "laki-laki"
pola_nama_laki_laki <- grep(pattern = "laki-laki", x = names(penduduk.dki.xlsx), ignore.case = TRUE)
names(penduduk.dki.xlsx[pola_nama_laki_laki])
# pattern = "(perempuan|laki-laki)" -> untuk perumpuan dan laki-laki

# Menambahkan kolom Penjumlahan
penduduk.dki.xlsx$PEREMPUAN35TAHUNKEATAS  <- rowSums(penduduk.dki.xlsx[pola_nama_perempuan])

# Library reshape
library(reshape2)
#Transformasi kolom dataset penduduk.dki.xlsx, disimpan ke variable penduduk.dki.transform
penduduk.dki.transform <- melt(data = penduduk.dki.xlsx, id.vars = c( "NAMA.KECAMATAN", "NAMA.KELURAHAN"), 
    measure.vars = c("35-39.Laki-Laki", "35-39.Perempuan"), variable.name = "DEMOGRAFIK", value.name = "JUMLAH")

#Memecah isi kolom DEMOGRAFIK menjadi "RENTANG.UMUR" dan "JENIS.KELAMIN"
penduduk.dki.transform[c("RENTANG.UMUR", "JENIS.KELAMIN")] <- 
    colsplit(penduduk.dki.transform$DEMOGRAFIK,"\\.",c("RENTANG.UMUR","JENIS.KELAMIN"))
penduduk.dki.transform$DEMOGRAFIK <- NULL