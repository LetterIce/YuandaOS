CLS
PRINT "Tentang - ketik nomor untuk menjalankan perintah"
PRINT ""
PRINT "1. Nama"
PRINT "2. NIM"
PRINT "3. Tanggal Lahir"
PRINT "4. Alamat"
PRINT "5. No HP"
PRINT "6. Tampilkan semua"
PRINT "7. Keluar"
PRINT ""

startloop:
  PRINT "Masukkan Pilihan"
  WAITKEY X
  IF X = '1' THEN GOTO printnama
  IF X = '2' THEN GOTO printnim
  IF X = '3' THEN GOTO printlahir
  IF X = '4' THEN GOTO printalamat
  IF X = '5' THEN GOTO printhp
  IF X = '6' THEN GOTO printsemua
  IF X = '7' THEN GOTO keluar
  PRINT "Masukkan Tidak Valid!"
  GOTO startloop

printnama:
  PRINT ""
  PRINT "Yuanda Kusuma Aji"
  PRINT ""
  GOTO ulang
  
printnim:
  PRINT ""
  PRINT "A11.2023.14944"
  PRINT ""
  GOTO ulang

printlahir:
  PRINT ""
  PRINT "10 Mei 2004"
  PRINT ""
  GOTO ulang

printalamat:
  PRINT ""
  PRINT "Pati"
  PRINT ""
  GOTO ulang

printhp:
  PRINT ""
  PRINT "085741322625"
  PRINT ""
  GOTO ulang

printsemua:
  PRINT ""
  PRINT "Yuanda Kusuma Aji"
  PRINT "A11.2023.14944"
  PRINT "10 Mei 2004"
  PRINT "Pati"
  PRINT "085741322625"
  PRINT ""

ulang:
  PRINT "Apakah anda ingin kembali menjalankan program? (y/n)"
  WAITKEY U
  PRINT ""
  IF U = 'y' THEN 
    CLS
    PRINT "Tentang - ketik nomor untuk menjalankan perintah"
    PRINT ""
    PRINT "1. Nama"
    PRINT "2. NIM"
    PRINT "3. Tanggal Lahir"
    PRINT "4. Alamat"
    PRINT "5. No HP"
    PRINT "6. Tampilkan semua"
    PRINT "7. Keluar"
    PRINT ""
    GOTO startloop
  IF U = 'n' THEN GOTO backtoroot
  GOTO ulang

keluar:
  PRINT "Apakah anda ingin keluar? (y/n)"
  WAITKEY K
  IF K = 'y' THEN GOTO backtoroot
  IF K = 'n' THEN GOTO startloop
  GOTO keluar	
  
backtoroot:
  END