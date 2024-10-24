REM ------------------------------------------------
REM ADVENTURE 2.3 -- Oleh Justin Tokarchuk
REM Untuk MikeOS dan Turunan MikeBasic
REM ------------------------------------------------

REM VARS:
REM $1 = Nama Pemain
REM a = nomor ruangan
REM b = punya catatan
REM c = punya lilin
REM d = membuka peti harta karun
REM e = punya kunci

a = 1
b = 0
c = 0
d = 0
e = 0
f = 0
$1 = ""

LOGO:
  CLS
  PRINT "          _______     __                     __                     __ " 
  PRINT "         |   _   |.--|  |.--.--.-----.-----.|  |_.--.--.----.-----.|  |"
  PRINT "         |       ||  _  ||  |  |  -__|     ||   _|  |  |   _|  -__||__|"
  PRINT "         |___|___||_____| \___/|_____|__|__||____|_____|__| |_____||__|"
  PRINT " "
  PRINT "         --------------------------------------------------------------"
  PRINT "                       |   Sebuah Permainan Petualangan Berbasis Teks   |              "
  PRINT "                         -------------------------------               "
  PRINT ""
  PRINT ""
  PRINT ""
  PRINT ""

DAPATKAN_NAMA:
  PRINT ""
  PRINT " Siapa namamu?: " ;
  INPUT $1
  IF $1 = "" THEN GOTO DAPATKAN_NAMA

KOMENTAR_NAMA:
  RAND X 1 3
  PRINT ""
  PRINT " " ;
  PRINT $1 ;
  if x = 1 then PRINT "! Apa ibumu mencintaimu? Yah, itu namamu."
  if x = 2 then PRINT "? Nama macam apa itu! Yah, tidak seperti kita bisa mengubahnya."
  if x = 3 then PRINT "!? Kamu bukan dari sekitar sini, kan?"
  GOSUB TEKAN_TOMBOL
  
GOTO INTRO_PERMAINAN

BANTUAN:
  PRINT ""  
  PRINT " Berikut adalah perintah yang valid dalam permainan:"
  PRINT ""
  PRINT " CLS                       - BERSIHKAN LAYAR"
  PRINT " LIHAT                     - CETAK ULANG DESKRIPSI RUANGAN"
  PRINT " INVENTARIS                - LIHAT APA YANG KAMU BAWA"
  PRINT " UTARA, BARAT, SELATAN, TIMUR - BERGERAK KE ARAH YANG DIMASUKKAN"
  PRINT " PERIKSA (OBJEK)           - PERIKSA SEBUAH OBJEK"
  PRINT " GUNAKAN (OBJEK)            - GUNAKAN SEBUAH OBJEK"
  PRINT " AMBIL (OBJEK)             - AMBIL SEBUAH OBJEK"
  PRINT " BUKA (OBJEK)              - BUKA SEBUAH KOTAK"
  PRINT " BUKA_KUNCI (OBJEK)         - COBA UNTUK MEMBUKA KUNCI OBJEK"
  PRINT " BANTUAN                   - LIHAT PERINTAH INI LAGI"
  PRINT " KELUAR                    - KELUAR DARI PERMAINAN"
  RETURN

HURUF_KECIL:
  J = & $2
  FOR X = 1 TO 20
    PEEK K J
    IF K < 65 THEN GOTO BUKAN_HURUF_KAPITAL
    IF K > 90 THEN GOTO BUKAN_HURUF_KAPITAL
    K = K + 32
    POKE K J
    BUKAN_HURUF_KAPITAL:
    J = J + 1
  NEXT X
RETURN

INTRO_PERMAINAN:
  PRINT ""
  PRINT " MALAM HALLOWEEN. Malam paling menakutkan sepanjang tahun! Tidak terlalu menakutkan"
  PRINT " di kamarmu yang kotor ini. Jadi bagaimana jika kertas toilet membutuhkan waktu berjam-jam"
  PRINT " untuk membersihkan rumah PAK RAUL. Kenapa aku harus dihukum?"
  GOSUB TEKAN_TOMBOL
  PRINT " SUDAHLAH. Aku adalah " ;
  PRINT $1 ;
  PRINT ", aku perkasa! Aku tidak akan ditahan oleh orang tua!"
  PRINT " Aku akan menyelinap keluar, dan membuktikan kepada semua orang bahwa rumah PAK RAUL"
  PRINT " tidak berhantu!"
  GOSUB TEKAN_TOMBOL
  PRINT " Kamu menyelinap menuruni tangga dari kamarmu, dan melihat ibumu sedang"
  PRINT " tidur nyenyak di sofa! Kesempatan datang! Kamu melesat melalui"
  PRINT " pintu depan dan menyeberang jalan ke rumah PAK RAUL."
  GOSUB TEKAN_TOMBOL
  PRINT " Kamu melihat pintu terbuka sedikit, kamu mendorong pintu terbuka dan masuk"
  PRINT " ke dalam."
  GOSUB TEKAN_TOMBOL
  PRINT " -- BRAK!! -- Oh tidak! Pintu itu terbanting menutup di belakangmu! -- KLIK! --"
  PRINT " Kamu memeriksa pintu itu dan menemukan gembok yang menguncinya!"
  GOSUB TEKAN_TOMBOL
  GOSUB PINDAH_RUANGAN
  GOTO PENGURAI   
 
PINDAH_RUANGAN:
  IF a = 1 THEN GOSUB R1
  IF a = 2 THEN GOSUB R2
  IF a = 3 THEN GOSUB R3
  IF a = 4 THEN GOSUB R4
  IF a = 5 THEN GOSUB R5
  IF a = 6 THEN GOSUB R6
  RETURN

R1:
  PRINT ""
  PRINT " -- Pintu Masuk Rumah -- "
  PRINT " Pintu masuk rumah."
  PRINT " Ada gembok besar di belakangmu, menghalangi kebebasanmu." 
  RETURN

R2:
  PRINT ""
  PRINT " -- Ruang Makan -- "
  PRINT " Ada meja besar di tengah ruangan. Ada beberapa"
  PRINT " pintu keluar dari ruangan ini. Kamu melihat lukisan besar."
  RETURN

R3:
  PRINT ""
  PRINT " -- Dapur -- "
  PRINT " Ada pintu di ruangan ini, dengan pintu terlepas dari"
  PRINT " engselnya. Aneh, pikirmu. Sisa dapur tampak bersih."
  RETURN

R4:
  PRINT ""
  PRINT " -- Kamar Mandi -- "
  PRINT " Aneh, karena ini kamar mandi, tidak ada jendela atau metode"
  PRINT " ventilasi."
  IF c = 0 THEN PRINT " Ada lilin di atas wastafel."
  RETURN

R5:
  PRINT ""
  PRINT " -- Kamar Tidur -- "
  PRINT " Sebuah pintu mengarah kembali ke ruang makan." 
  RETURN

R6:
  PRINT ""
  PRINT " -- Ruang Bawah Tanah -- "
  IF c = 1 THEN PRINT " + Kamu menyalakan lilinmu."
  IF c = 1 THEN PRINT " Ada peti harta karun di lantai."
  IF c = 0 THEN PRINT " Terlalu gelap untuk melihat apa pun di sini."
  RETURN

PENGURAI:
  x = 0
  PRINT ""
  PRINT "> " ;
  INPUT $2
  GOSUB HURUF_KECIL
  IF $2 = "bersihkan" THEN CLS
  IF $2 = "bantuan" THEN GOSUB BANTUAN
  IF $2 = "utara" THEN GOSUB UTARA
  IF $2 = "u" THEN GOSUB UTARA
  IF $2 = "selatan" THEN GOSUB SELATAN
  IF $2 = "s" THEN GOSUB SELATAN
  IF $2 = "barat" THEN GOSUB BARAT
  IF $2 = "b" THEN GOSUB BARAT
  IF $2 = "timur" THEN GOSUB TIMUR
  IF $2 = "t" THEN GOSUB TIMUR
  IF $2 = "lihat" THEN GOSUB PINDAH_RUANGAN
  IF $2 = "inventaris" THEN GOSUB INVENTARIS
  IF $2 = "periksa karpet" AND a = 1 THEN PRINT " Karpet tua yang usang dan bernoda."
  IF $2 = "periksa meja" AND a = 2 THEN PRINT " Meja kayu keras yang megah."
  IF $2 = "periksa meja" AND a = 2 AND b = 0 THEN PRINT " Sebuah catatan ada di atasnya."
  IF $2 = "periksa lukisan" AND a = 2 THEN PRINT " Itu adalah gambar PAK RAUL"
  IF $2 = "ambil catatan" AND a = 2 AND b = 0 THEN b = 1
  IF $2 = "ambil catatan" AND a = 2 AND b = 1 THEN PRINT " Kamu sudah mengambil catatan itu."
  IF $2 = "buka peti harta karun" THEN GOSUB PETI_HARTA_KARUN
  IF $2 = "buka_kunci pintu" AND a = 1 AND e = 1 THEN GOTO AKHIR_PERMAINAN
  IF $2 = "gunakan catatan" THEN GOSUB CATATAN
  IF $2 = "baca catatan" THEN GOSUB CATATAN
  IF $2 = "ambil lilin" AND a = 4 AND c = 0 THEN GOSUB LILIN
  IF $2 = "keluar" THEN END
  IF $2 = "" THEN PRINT " Bingung? Butuh bantuan? Ketik BANTUAN untuk daftar perintah!"
  GOTO PENGURAI

LILIN:
  PRINT " + Kamu mengambil lilin dari wastafel."
  c = 1
  RETURN

PETI_HARTA_KARUN:
  IF a = 6 AND c = 1 THEN e = 1
  IF a = 6 AND e = 1 AND f = 0 THEN PRINT " + Kamu membuka peti harta karun dan mengambil KUNCI darinya."
  IF f = 1 THEN PRINT " Kamu sudah mendapatkan harta karunnya!" 
  f = 1
  RETURN    

CATATAN:
  IF b = 1 THEN PRINT " Catatan itu bertuliskan:"
  IF b = 1 THEN PRINT " Rahasia kebebasanmu terletak di dalam kotak!"
  RETURN

AKHIR_PERMAINAN:
  PRINT " Kamu membuka kunci pintu dan bergegas keluar sambil menarik napas lega!"
  PRINT " Hari sudah hampir malam dan kamu hampir harus bermalam! Kamu "
  PRINT " memutuskan bahwa akan bijaksana untuk pulang sebelum ibu bangun."
  PRINT " PERMAINAN BERAKHIR! Terima kasih telah bermain!"
  END

INVENTARIS:
  PRINT ""
  IF b = 0 AND c = 0 AND e = 0 THEN GOSUB KOSONG
  IF b = 1 THEN PRINT " CATATAN"   
  IF c = 1 THEN PRINT " LILIN"  
  IF e = 1 THEN PRINT " KUNCI"
  RETURN

KOSONG:
  RAND X 1 5
  IF X = 1 THEN PRINT " Tidak ada apa-apa. Bahkan seekor lalat pun tidak keluar dari ranselmu."
  IF X = 2 THEN PRINT " Kamu bertanya-tanya mengapa ranselmu begitu ringan, ternyata kosong."
  IF X = 3 THEN PRINT " Ranselmu kosong dengan mengejutkan."
  IF X = 4 THEN PRINT " Terlepas dari beberapa lalat mati di ranselmu, itu kosong."
  IF X = 5 THEN PRINT " Ranselmu penuh dengan jarahan!"
  IF X = 5 THEN PRINT " Tidak juga, itu kosong."
  RETURN

TIDAK_ADA_ARAH:
  RAND X 1 3
  IF x = 1 THEN PRINT " ..Jadi begitulah rasanya dinding di wajahku. Luar biasa."
  IF x = 2 THEN PRINT " Kamu tidak bisa pergi ke sana."
  IF x = 3 THEN PRINT " Kamu menang!"
  IF x = 3 THEN PRINT " .... Bercanda." 
  RETURN

UTARA:
  REM -- PINTU MASUK KE RUANG MAKAN --
  IF a = 1 THEN x = 1
  IF a = 1 THEN a = 2
  IF x = 1 THEN GOSUB PINDAH_RUANGAN
  IF x = 1 THEN RETURN
  REM -- RUANG MAKAN KE DAPUR --
  IF a = 2 THEN x = 2
  IF a = 2 THEN a = 3
  IF x = 2 THEN GOSUB PINDAH_RUANGAN
  IF x = 2 THEN RETURN
  GOSUB TIDAK_ADA_ARAH  
  RETURN

BARAT:
  REM -- PINTU MASUK KE KAMAR TIDUR --
  IF a = 1 THEN x = 1
  IF a = 1 THEN a = 5
  IF x = 1 THEN GOSUB PINDAH_RUANGAN
  IF x = 1 THEN RETURN
  REM -- RUANG MAKAN KE RUANG BAWAH TANAH --
  IF a = 2 THEN x = 2
  IF a = 2 THEN a = 6
  IF x = 2 THEN GOSUB PINDAH_RUANGAN
  IF x = 2 THEN RETURN
  REM -- DAPUR KE KAMAR MANDI
  IF a = 3 THEN x = 3
  IF a = 3 THEN a = 4
  IF x = 3 THEN GOSUB PINDAH_RUANGAN
  IF x = 3 THEN RETURN
  GOSUB TIDAK_ADA_ARAH
  RETURN

SELATAN:
  REM -- RUANG MAKAN KE PINTU MASUK
  IF a = 2 THEN x = 2
  IF a = 2 THEN a = 1
  IF x = 2 THEN GOSUB PINDAH_RUANGAN
  IF x = 2 THEN RETURN
  REM -- DAPUR KE RUANG MAKAN --
  IF a = 3 THEN x = 3
  IF a = 3 THEN a = 2
  IF x = 3 THEN GOSUB PINDAH_RUANGAN
  IF x = 3 THEN RETURN
  GOSUB TIDAK_ADA_ARAH
  RETURN

TIMUR:
  REM -- KAMAR MANDI KE DAPUR --
  IF a = 4 THEN x = 4
  IF a = 4 THEN a = 3
  IF x = 4 THEN GOSUB PINDAH_RUANGAN
  IF x = 4 THEN RETURN
  REM -- KAMAR TIDUR KE PINTU MASUK --
  IF a = 5 THEN x = 5
  IF a = 5 THEN a = 1
  IF x = 5 THEN GOSUB PINDAH_RUANGAN
  IF x = 5 THEN RETURN
  REM -- RUANG BAWAH TANAH KE RUANG MAKAN --
  IF a = 6 THEN x = 6
  IF a = 6 then a = 2
  IF x = 6 THEN GOSUB PINDAH_RUANGAN
  IF x = 6 THEN RETURN
  GOSUB TIDAK_ADA_ARAH
  RETURN

TEKAN_TOMBOL:
  PRINT ""
  PRINT " -- Tekan tombol apa saja untuk melanjutkan. --"
  WAITKEY X
  PRINT ""
  RETURN