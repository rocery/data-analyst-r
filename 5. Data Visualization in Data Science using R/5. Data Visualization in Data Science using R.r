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
# Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data = penduduk.dki, aes(x = KEPADATAN..JIWA.KM2.))
# Menambahkan fill
plot.dki <- ggplot(data=penduduk.dki, aes(x = KEPADATAN..JIWA.KM2., fill = NAMA.KABUPATEN.KOTA))
plot.dki + geom_histogram(binwidth = 5000)


# -------------Visualisasi Trend dengan Line Chart----------
#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("inflasi.csv", sep = ",")
# Memperbaiki Urutan Bulan dengan Factoring supaya berurutan Jan-Des
inflasi.indo.sing$Bulan <- factor(inflasi.indo.sing$Bulan,
 levels = c("Jan-2017", "Feb-2017", "Mar-2017", "Apr-2017", "May-2017",
 "Jun-2017", "Jul-2017", "Aug-2017", "Sep-2017", "Oct-2017"))
#Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data = inflasi.indo.sing, aes(x = Bulan,
 y = Inflasi, color = Negara, group = Negara))
# Menambahkan layer
plot.inflasi + geom_line() + geom_text(aes(label=Inflasi),hjust=-0.2, vjust=-0.5)