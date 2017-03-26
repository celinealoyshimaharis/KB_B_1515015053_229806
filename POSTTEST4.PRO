/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
 
 Nama : Celine Aloyshima Haris
 NIM  : 151501503
 Kelas : B-2015
 
************************************POSTTEST4---Praktikum Kecerdasan Buatan********************************/




trace   %merupakan tempat atau laman untuk menelusuri jalannya program
	%trace juga digunakan untuk menspesifikasikan bagaimana prolog menjawab pertanyaan

domains	%menyatakan jenis suatu variabel/argument dan mendelarasikan type data
  name,sex,occupation,object,vice,substance = symbol  %symbol merupakan serangkaian karakter yang diawali dengan huruf kecil dan tanpa ada tanda apapun
  age=integer   %age memiliki type data berupa bilangan bulat yaitu integer

predicates	%nama simbolik untuk relasi, haruf diawali dengan huruf kecil
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o) % dikatakan orang(person) jika memenuhi parmeter yang memiiki nama,umur,jenis kelamin, dan pekerjaan
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)   %orang yang bernama memiliki urusan/hubungan/skandal dengan orang yang bernama lainnya. Bisa berupa (input,input) atau berupa (input,output)
  killed_with(name,object) - determ (i,o)%orang yang bernama terbunuh dengan suatu objek(benda). Berupa (input,output)
  killed(name) - procedure (o)  %orang yang bernama telah terbunuh. Berupa (output)
  killer(name) - nondeterm (o)  %orang yang bernama telah terbunuh. Berupa (output)
  motive(vice) - nondeterm (i)  %sesuatu yang buruk adalah motifnya. Berupa (input)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)  %orang yang bernama telah ternodai/berlumur suatu zat/bahan. Berupa (input,output)
  owns(name,object) - nondeterm (i,i)  %orang yang bernama memiliki suatu objek. Berupa (input,input)
  operates_identically(object,object) - nondeterm (o,i)  %suatu objek berfungsi identik dengan objek lainnya. Berupa (output,input)
  owns_probably(name,object) - nondeterm (i,i)  %suatu objek kemungkinan  berfungsi dengan objek lainnya. Berupa (input,input)
  suspect(name) - nondeterm (i) %orang yang bernama adalah tersangka. Berupa (input)
%nondeterm menandakan jika relasi dari objek disampingnya memiliki banyak kemungkinan atau solusi


/* * * Facts about the murder * * */  % Fakta-fakta tentang pembunuhan 
clauses	%memberikan fakta dan aturan yang ada dalam melakukan pengujian untuk mencari solusi, mengakhirinya menggunakan tanda titik(.)
  %pendeklarasikan fakta/kebenaran yang ada
  person(bert,55,m,carpenter).	% seorang bernama bert, berumur 55 thn, berjenis kelamin pria bekerja sebagai tukang kayu)	
  person(allan,25,m,butcher).% seorang bernama allan, berumur 25 thn, berjenis kelamin pria bekerja sebagai tukang jagal)
  person(allan,25,m,football_player).  % seorang bernama allan, berumur 25 thn, berjenis kelamin pria bekerja sebagai pemain sepak bola)
  person(john,25,m,pickpocket).  % seorang bernama john, berumur 25 thn, berjenis kelamin pria bekerja sebagai pencopet)

  had_affair(barbara,john). %Barbara memiliki urusan/hubungan/skandal dengan john.
  had_affair(barbara,bert).%Barbara memiliki urusan/hubungan/skandal dengan bert.
  had_affair(susan,john). %Susan memiliki urusan/hubungan/skandal dengan john.

  killed_with(susan,club). %Susan terbunuh dengan pentungan kayu.
  killed(susan).%Susan telah  terbunuh

  motive(money).%Uang adalah motifnya
  motive(jealousy).%Cemburu adalah motifnya
  motive(righteousness).%Kebenaran adalah motifnya

  smeared_in(bert,blood).%Bert berlumur darah
  smeared_in(susan,blood). %Susan berlumur darah
  smeared_in(allan,mud).%Allan berlumur lumpur
  smeared_in(john,chocolate).%John berlumur cokelat
  smeared_in(barbara,chocolate). %Barbara berlumur cokelat

  owns(bert,wooden_leg).  %Bert memiliki kaki kayu (kaki palsu)
  owns(john,pistol). %John  memiliki pistol

/* * * Background knowledge * * */ %Latar belakang pengetahuan 

  operates_identically(wooden_leg, club).  %kaki kayu(kaki palsu) beroperasi/cara kerjanya identik dengan pentungan
  operates_identically(bar, club).  % balok beroperasi/cara kerjanya identik dengan pentungan 
  operates_identically(pair_of_scissors, knife). %gunting beroperasi/cara kerjanya identik dengan pisau
  operates_identically(football_boot, club).   %sepatu bola  beroperasi/cara kerjanya  identik dengan pentungan

  owns_probably(X,football_boot):- %Si X kemungkinan memiliki sepatu bola JIKA
	person(X,_,_,football_player). %Si X adalah orang yang berumur dan memiliki jenis kelamin apapun serta merupakan pemain bola
  owns_probably(X,pair_of_scissors):-   %Si X kemungkinan memiliki gunting JIKA
	person(X,_,_,hairdresser).%Si X adalah orang yang berumur dan memiliki jenis kelamin apapun serta merupakan penata rambut.
  owns_probably(X,Object):- %Si X kemungkinan memiliki objek
	owns(X,Object). %Si  X memiliki objek

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *  Kemungkinan semua orang yang memiliki senjata dengan 
 * which Susan could have been killed.       *     Yang Susan miliki seperti pebunuh
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-  %Si X adalah tersangka JIKA :
	killed_with(susan,Weapon) ,  %Susan terbunuh dengan senjata
	operates_identically(Object,Weapon) , %Suatu Objek beroperasi/berjalan identik dengan senjata
	owns_probably(X,Object).  %Si X kemungkinan  memiliki objek (benda)

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *  Pria Tersangka yang telah berselingkuh dengan Susan
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-%Si X adalah tersangka JIKA :
	motive(jealousy),   %Cemburu adalah motifnya
	person(X,_,m,_),   %Si X adalah orang yang berumur sekian, berjenis kelamin pria,dan memiliki pekerjaan apapun.
	had_affair(susan,X). %Susan memiliki urusan/hubungan dengan Si X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *  Tersangka perempuan memiliki perselingkuhan 
 * affair with someone that Susan knew.  *  dengan seseorang yang Susan ketahui
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-  % Si X adalah tersangka JIKA :
	motive(jealousy),  %Cemburu adalah motifnya)
	person(X,_,f,_), %Si X adalah orang berumur sekian, berjenis kelamin perempuan, dan memiliki suatu pekerjaan
	had_affair(X,Man),%Si X memiliki urusan./hubungan dengan seorang pria
	had_affair(susan,Man). %Susan memiliki urusan/hubungan dengan seorang pria

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *  Tersangka pencopetnya siapa tau memiliki motif akan uang.
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-%Si X adalah tersangka JIKA :
	motive(money), %uang adalah motifnya 
	person(X,_,_,pickpocket). %Si X adalah orang yang berumur, berjenis kelamin apasaja,dan merupakan pencopet.

  killer(Killer):- %seorang pembunuh dikatakan pembunuh JIKA :
	person(Killer,_,_,_),%Si Pembunuh adalah orang yang tidak memiliki umur, tidak memiliki jenis kelamin, dan tidak memiliki pekerjaan
	killed(Killed),  %Telah tewas yang terbunuh
	Killed <> Killer, /* It is not a suicide */   %Ini bukan bunuh diri 
	suspect(Killer),%pembunuh itu tersangka
	smeared_in(Killer,Goo), %pembunuh itu ternodai/berisikan dengan Goo
	smeared_in(Killed,Goo).  %pembunuh itu ternodai/berisikan dengan Goo

goal	%merupakan capaian dari tujuan yang dikehendaki pada program, program berhenti jika terjadi kegagalan
  killer(X).  %Si X adalah pembunuhnya


/**	
-Program mencari pernyataan terbunuh, fakta yang ditemukan adalah susan. 
Kemudian program melakukan pencarian pada pernyataan dicurigai(X), dari pernyataan tersebut dilakukan proses pencarian menggunakan unifikasi terhadap pernyataan persyaratan tersebut. 
Kemudian program akan mencari senjata yang di pakai untuk membunuh, dengan melakukan proses di variable terbunuh_dengan dan fakta yang diperoleh ialah terbunuh_dengan(susan, pentungan).
-Program melakukan proses pencarian fakta benda yang cara kerjanya seperti senjata, maka diperoleh cara_kerja_mirip(Benda, Senjata). 
Kemudian prolog memanggil pernyataan tersebut untuk mengetahui benda yang cara kerjanya mirip pentungan yang telah di eksekusi pada langkah sebelumnya. 
Maka fakta yang didapat ialah cara_kerja_mirip(kaki_palsu, pentungan).
Setelah itu program akan melakukan proses fakta dari variable kemungkinan_milik(X, Benda), milik(X, Benda).
Dari pernyataan itu, program mencari fakta siapa pemilik kaki palsu, dan hasilnya milik(bert, kaki_palsu). 
Jadi kaki_palsu itu miliknya bert.
-Program menjalankan proses pernyataan dari pembunuh karena masih terdapat pernyataan yang belum diproses, yaitu pada variable ternodai(Pembunuh, Zat). 
Maka dijalankanlah proses ke dalam pernyataan tersebut, yang menyangkut nama/kata bert, maka hasilnya didapat ternodai(bert, darah).
Selanjutnya program melakukan proses terakhir yaitu pada ternodai(Terbunuh, Zat).
Maka akan di dapat hasil ternodai(susan, darah).
Kesimpulan dari pernyataan-pernyataan dan fakta-fakta yang telah ada, maka siti memiliki noda sama persis dengan bert. 
Berdasarkan kesamaan fakta-fakta tersebut, goal menampilkan bahwa bertlah yang membunuh susan.
**/
