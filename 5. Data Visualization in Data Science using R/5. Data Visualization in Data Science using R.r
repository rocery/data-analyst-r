library(ggplot2)

# --------------Dasar "Kanvas" untuk Grafik-------------------
# ggplot() + labs(title = "Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")

plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")
plot.jakarta <- plot.jakarta + labs(x = "Label X", y = "Label Y")
# plot.jakarta


# ----------Data dan Aesthetic Mapping---------------
# Membaca data CSV
penduduk.dki <- read.csv("dkikepadatankelurahan2013.csv", sep = ",")
# Menampilkan " NAMA.KELURAHAN " dan "LUAS.WILAYAH..KM2."
penduduk.dki[c("NAMA.KELURAHAN", "LUAS.WILAYAH..KM2.")]

# Melakukan plotting pada data
plot.dki <- ggplot(data = penduduk.dki)
# Melihat summary pada plot
summary(plot.dki)

# Memasukan fungsi aes pada plotting
plot.dki <- ggplot(data = penduduk.dki, aes(x = LUAS.WILAYAH..KM2., y = KEPADATAN..JIWA.KM2., color = NAMA.KABUPATEN.KOTA))


# --------Layer untuk Grafik Pertama: Scatter Plot-----------
# Menambahkan layer untuk menghasilkan scatter plot
plot.dki + layer(geom = "point", stat = "identity", position = "identity")
# baris kode diatas bisa diubah menjadi
plot.dki + geom_point()
#Menambahkan Layer dan labels
plot.dki + geom_point() +
# code untuk menempatkan judul di tengah plot
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(title = "Luas Wilayah vs Kepadatan Penduduk DKI Jakarta",
  x = "Luas wilayah (km2)", y = "Kepadatan Jiwa per km2",
  color = "Nama Kabupaten/Kota")


# -----------------Histogram-------------------
#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data = penduduk.dki, aes(x = KEPADATAN..JIWA.KM2.))
plot.dki + geom_histogram(binwidth = 5000)