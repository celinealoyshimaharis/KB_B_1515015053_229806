/*
Nama	: Celine Aloyshima Haris
NIM	: 1515015053
Kelas	: B 2015
POSTTEST 3 Praktikum Kecerdasan Buatan
*/


domains  %menyatakan jenis suatu variabel/argument dan mendelarasikan type data
a = STRING %a memiliki type data berupa karakter yaitu string 
b = INTEGER %b memiliki type data berupa bilangan bulat yaitu integer 


predicates %nama simbolik untuk relasi, haruf diawali dengan huruf kecil
nondeterm hewan (a,a)
nondeterm memiliki (a,a)
nondeterm berumur(a,b)
nondeterm hidup (a,a)
nondeterm bernapas (a,a)
nondeterm bisa_berenang
nondeterm tdk_hidup_diair
%nondeterm menandakan jika relasi dari objek disampingnya memiliki banyak kemungkinan atau solusi

clauses   %memberikan fakta dan aturan yang ada dalam melakukan pengujian untuk mencari solusi, mengakhirinya menggunakan tanda titik(.)
hewan("Kucing","Mamalia"). %pendeklarasikan fakta/kebenaran yang ada
hewan("Singa","Mamalia").
hewan("Macan","Mamalia").
hewan("Paus","Mamalia").
hewan("Lumba-lumba","Mamalia").
hewan("Domba","Mamalia").
hewan("Kelinci","Mamalia").
hewan("Ikan_Pari","Ovovivipar").
hewan("Hiu","Ovovivipar").

memiliki("Kucing","Cakar").
memiliki("Singa","Cakar").
memiliki("Macan","Cakar").
memiliki("Paus","Sirip").
memiliki("Lumba-lumba","Sirip").
memiliki("Domba","Bulu").
memiliki("Kelinci","Telinga").
memiliki("Ikan_Pari","Sirip").
memiliki("Hiu","Sirip").

bernapas("Kucing","Paru-paru").
bernapas("Singa","Paru-paru").
bernapas("Macan","Paru-paru").
bernapas("Paus","Paru-paru").
bernapas("Lumba-lumba","Paru-paru").
bernapas("Domba","Paru-paru").
bernapas("Kelinci","Paru-paru").
bernapas("Ikan_Pari","Insang").
bernapas("Hiu","Insang").

berumur("Kucing",6).
berumur("Singa",8).
berumur("Macan",9).
berumur("Paus",120).
berumur("Lumba-lumba",10).
berumur("Domba",5).
berumur("Kelinci",3).
berumur("Ikan_Pari",2).
berumur("Hiu",7).

hidup("Kucing","Darat").
hidup("Singa","Darat").
hidup("Macan","Darat").
hidup("Paus","Air").
hidup("Lumba-lumba","Air").
hidup("Domba","Darat").
hidup("Kelinci","Darat").
hidup("Ikan_Pari","Air").
hidup("Hiu","Air").

bisa_berenang:-hewan(X,_),bernapas(X,_),memiliki(X,"Sirip"),hidup(X,"Air"),berumur(X,Y),Y>9,!,write(X,"bisa berenang","\n"),fail.  %aturan yang ditetapkan
bisa_berenang.   %aturan yang ditetapkan
tdk_hidup_diair:-hewan(X,"Mamalia"),bernapas(X,"Paru-paru"),memiliki(X,_),not(hidup(X,"Air")),berumur(X,Y),Y<=8,write(X,"tidak hidup di air","\n"),fail. %aturan yang ditetapkan
tdk_hidup_diair.


goal %merupakan capaian dari tujuan yang dikehendaki pada program, program berhenti jika terjadi kegagalan
tdk_hidup_diair.
%untuk tampilan  bisa dirubah dengan mencari hewan yang bisa berenang

%materi terkait fail dan penggunaan tanda seru ! sudah dipelajari saat jumat kemarin jadi sy berinisiatif untuk mencoba membuat programnya

/*dalam aturan diatas hewan yg bisa berenang adalah jika X hewan setiap_bagian dan hewan X memiliki sitip dan hewan X hidup di air sebagai pembanding untuk mencari
hewan yg berumur diatas 9tahun maka akan digunakan aturan dan X berumur Y yang dimana Y>9 dengan menggunakan simbol ! atau cut agar tidak melakukan pelacakan kembali.
lalu setelah itu ditambahkan fail untuk melakukan pelacakan kembali agar dapat menemukan yang ingin di cari lagi.
begitupun sebaliknya untuk hewan yang tidak bisa hidup diair yang membedakannya hanya di umurnya dimana Y<=8.
*/
