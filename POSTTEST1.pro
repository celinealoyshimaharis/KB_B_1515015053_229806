/*
Nama	: Celine Aloyshima Haris
NIM	: 1515015053
Kelas	: B 2015
POSTTEST 1 Praktikum Kecerdasan Buatan
*/


domains  %menyatakan jenis suatu variabel/argument dan mendelarasikan type data
angka=integer %angka memiliki type data bilangan bulat 
orang,matkul=symbol %orang, matkul berisi rangkaian huruf/angka/karakter yang diawali dengan dengan huruf kecil dan tdk mengandung spasi/karakter khusus


constants %mendefiniikan beberapa nilai yang digunakan dalam program yang merupakan bagian dari basis data dinamik (dapat berubah sesuai kebutuhan)
angka1=46
angka2=42

predicates %nama simbolik untuk relasi, haruf diawali dengan huruf kecil
nondeterm suka(orang,matkul)
nondeterm tambah(angka,angka,angka)
nondeterm wanita(orang)
nondeterm laki(orang)
nondeterm mat_kul(matkul)
nondeterm penyuka(orang,matkul)
%nondeterm menandakan jika relasi dari objek disampingnya memiliki banyak kemungkinan atau solusi

clauses   %memberikan fakta dan aturan yang ada dalam melakukan pengujian untuk mencari solusi, mengakhirinya menggunakan tanda titik(.)
suka(terra,logikafuzzy). %pendeklarasikan fakta/kebenaran yang ada
suka(terri,sistempakar).
mat_kul(logikafuzzy).
mat_kul(sistempakar).
wanita(terra).
laki(terri).

penyuka(X,Y):-suka(X,Y),wanita(X),mat_kul(Y). %aturan yang ditetapkan
tambah(angka1,angka2,Hasil):-Hasil=angka1+angka2. %aturan yang ditetapkan

goal %merupakan capaian dari tujuan yang dikehendaki pada program, program berhenti jika terjadi kegagalan
penyuka(Orang,Matkul);
tambah(X,Y,Hasil).