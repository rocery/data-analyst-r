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


# -------------Bar Chart dan Pie Chart-----------
#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("datakependudukandki-dqlab.csv", sep = ",")

# Bar Chart 1
plot.dki <- ggplot(data = penduduk.dki, aes(x = NAMA.KABUPATEN.KOTA))
plot.dki + geom_bar()

# Bar Chart 2
plot.dki <- ggplot(data = penduduk.dki, aes(x = NAMA.KABUPATEN.KOTA, y = JUMLAH))
plot.dki + geom_bar(stat = "identity")

# Bar Chart 3
plot.dki <- ggplot(data = penduduk.dki, aes(x = NAMA.KABUPATEN.KOTA, y = JUMLAH, fill = JENIS.KELAMIN))
plot.dki + geom_bar(stat = "identity", position = "dodge")

# Melakukan agregasi rata-rata jumlah laki-laki/perempuan tiap kota
aggregate(x = list(RATARATA = penduduk.dki$JUMLAH), FUN = mean,
 by = list(NAMA.KABUPATEN.KOTA = penduduk.dki$NAMA.KABUPATEN.KOTA, JENIS.KELAMIN = penduduk.dki$JENIS.KELAMIN))

# Melakukan agregasi total jumlah laki-laki/perempuan tiap kota
aggregate(x = list(JUMLAH = penduduk.dki$JUMLAH), FUN = sum,
 by = list(NAMA.KABUPATEN.KOTA = penduduk.dki$NAMA.KABUPATEN.KOTA, JENIS.KELAMIN = penduduk.dki$JENIS.KELAMIN))

# Bar Chart 4
#Melakukan agregasi
p <- aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH), FUN=sum, by = list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA, JENIS.KELAMIN=penduduk.dki$JENIS.KELAMIN))
#Plot grafik
plot.dki <- ggplot(data=p, aes(x = NAMA.KABUPATEN.KOTA, y=JUMLAH, fill=JENIS.KELAMIN, label = JUMLAH))
plot.dki <- plot.dki + geom_bar(stat="identity", position="dodge")  
plot.dki <- plot.dki + labs(title="Jumlah Penduduk DKI Jakarta Umur > 35 - Tahun 2013", x="Kabupaten / Kota", y="Jumlah Penduduk")
plot.dki <- plot.dki + theme(axis.text.x = element_text(angle=45,vjust = 0.5), plot.title = element_text(hjust=0.5))
plot.dki <- plot.dki + geom_text(position = position_dodge(1.2))
plot.dki

# Pie Chart
#Melakukan agregasi
p <- aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH), FUN=sum, by = list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA))
#Plot grafik pie chart
plot.dki <- ggplot(data=p, aes(x="", y=JUMLAH, fill = NAMA.KABUPATEN.KOTA))
plot.dki <- plot.dki + geom_bar(width = 1, stat = "identity")
# Membuat bar chart menjadi pie chart
plot.dki <- plot.dki + coord_polar("y", start=0)
plot.dki


# ----------------------Membagi Grafik dengan Faceting------------
#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data=penduduk.dki, aes(x = LUAS.WILAYAH..KM2.,  y=KEPADATAN..JIWA.KM2.,  color=NAMA.KABUPATEN.KOTA))

# facet_wrap scatter plot
plot.dki <- plot.dki + layer(geom = "point", stat="identity", position = "identity")
plot.dki <- plot.dki + labs(x="Luas Wilayah (km2)", y="Kepadatan Jiwa (km2)", color="Kabupaten/Kota")
plot.dki + facet_wrap( ~ NAMA.KABUPATEN.KOTA, ncol=2)

# facet_wrap histogram
plot.dki <- plot.dki + geom_histogram(binwidth=10000)
plot.dki <- plot.dki + labs(x="Kepadatan Jiwa (km2)", y="Jumlah Kelurahan", color="Kabupaten/Kota")
plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol = 2)