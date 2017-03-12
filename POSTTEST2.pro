/*
Nama	: Celine Aloyshima Haris
NIM	: 1515015053
Kelas	: B 2015
POSTTEST 2 Praktikum Kecerdasan Buatan
*/



domains
nama,gender,pekerjaan,benda,alasan,zat = symbol
umur = integer

predicates
nondeterm orang(nama,umur,gender,pekerjaan)
nondeterm selingkuh(nama,nama)
terbunuh_dengan(nama,benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama,zat)
milik(nama,benda)
nondeterm cara_kerja_mirip(benda,benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)

%Fakta-fakta tentang pembunuhan
clauses  %program akan melacak data org yg telah dideklarasikan pada clauses ini
orang(budi,55,m,tukang_kayu).
orang(aldi,25,m,pemain_sepak_bola).
orang(aldi,25,m,tukang_jagal).
orang(joni,25,m,pencopet).
selingkuh(ina,joni).
selingkuh(ina,budi).
selingkuh(siti,joni).
terbunuh_dengan(siti,pentungan).
terbunuh(siti).
motif(uang).
motif(cemburu).
motif(dendam).
ternodai(budi,darah).
ternodai(siti,darah).
ternodai(aldi,lumpur).
ternodai(joni,cokelat).
ternodai(ina,cokelat).
milik(budi,kaki_palsu).
milik(joni,pistol).

%Basis pengetahuan
cara_kerja_mirip(kaki_palsu,pentungan).
cara_kerja_mirip(balok,pentungan).
cara_kerja_mirip(gunting,pisau).
cara_kerja_mirip(sepatu_bola,pentungan).
kemungkinan_milik(X,sepatu_bola):-   %X disini merupakan argument Pembunuh
orang(X,_,_,pemain_sepak_bola).
kemungkinan_milik(X,gunting):-
orang(X,_,_,pekerja_salon).
kemungkinan_milik(X,Benda):-
milik(X,Benda).

%dicurigai semua org yg memiliki senjata yg kerjannya mirip dengan senjata penyebab sititerbunuh
dicurigai(X):-
terbunuh_dengan(siti,Senjata),
cara_kerja_mirip(Benda,Senjata),
kemungkinan_milik(X,Benda).

%dicurigai laki-laki yang selingkuh dengan siti
dicurigai(X):-
motif(cemburu),
orang(X,_,m,_),
selingkuh(siti,X).

%dicurigai perempuan selingkuh dengan laki-laki yang selingkuh juga dengan siti
dicurigai(X):-
motif(cemburu),
orang(X,_,f,_),
selingkuh(X,Lakilaki),
selingkuh(siti,Lakilaki).

%dicurigai pencopetyang mempunyai motif uang
dicurigai(X):-
motif(uang),
orang(X,_,_,pencopet).
pembunuh(Pembunuh):-
orang(Pembunuh,_,_,_),
terbunuh(Terbunuh),
Terbunuh <> Pembunuh, %bukan bunuh diri
dicurigai(Pembunuh),
ternodai(Pembunuh,Zat),
ternodai(Terbunuh,Zat).

goal 
pembunuh(X).



/**	
-Program mencari pernyataan terbunuh, fakta yang ditemukan adalah siti. 
Kemudian program melakukan pencarian pada pernyataan dicurigai(X), dari pernyataan tersebut dilakukan proses pencarian menggunakan unifikasi terhadap pernyataan persyaratan tersebut. 
Kemudian program akan mencari senjata yang di pakai untuk membunuh, dengan melakukan proses di variable terbunuh_dengan dan fakta yang diperoleh ialah terbunuh_dengan(siti, pentungan).
-Program melakukan proses pencarian fakta benda yang cara kerjanya seperti senjata, maka diperoleh cara_kerja_mirip(Benda, Senjata). 
Kemudian prolog memanggil pernyataan tersebut untuk mengetahui benda yang cara kerjanya mirip pentungan yang telah di eksekusi pada langkah sebelumnya. 
Maka fakta yang didapat ialah cara_kerja_mirip(kaki_palsu, pentungan).
Setelah itu program akan melakukan proses fakta dari variable kemungkinan_milik(X, Benda), milik(X, Benda).
Dari pernyataan itu, program mencari fakta siapa pemilik kaki palsu, dan hasilnya milik(budi, kaki_palsu). 
Jadi kaki_palsu itu miliknya budi.
-Program menjalankan proses pernyataan dari pembunuh karena masih terdapat pernyataan yang belum diproses, yaitu pada variable ternodai(Pembunuh, Zat). 
Maka dijalankanlah proses ke dalam pernyataan tersebut, yang menyangkut nama/kata budi, maka hasilnya didapat ternodai(budi, darah).
Selanjutnya program melakukan proses terakhir yaitu pada ternodai(Terbunuh, Zat).
Maka akan di dapat hasil ternodai(siti, darah).
Kesimpulan dari pernyataan-pernyataan dan fakta-fakta yang telah ada, maka siti memiliki noda sama persis dengan budi. 
Berdasarkan kesamaan fakta-fakta tersebut, goal menampilkan bahwa budilah yang membunuh siti.
**/









