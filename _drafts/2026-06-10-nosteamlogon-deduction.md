---
date: 2026-06-10 10:13:33 +0700
title: Penyebab No Steam Logon dari sisi Server
category: blog
tags: server steam l4d2
header: 
     image: /assets/images/blog/2026-06-10-nosteamlogon-deduction/nosteamlogon.png
     teaser: /assets/images/blog/2026-06-10-nosteamlogon-deduction/nosteamlogon.png
gallery:
   - url: /assets/images/blog/2026-06-10-nosteamlogon-deduction/sequence-diagram-steam-server.png
     image_path: /assets/images/blog/2026-06-10-nosteamlogon-deduction/sequence-diagram-steam-server.png
gallery2:
   - url: /assets/images/blog/2026-06-10-nosteamlogon-deduction/cookies-problem.png
     image_path: /assets/images/blog/2026-06-10-nosteamlogon-deduction/cookies-problem.png
   - url: /assets/images/blog/2026-06-10-nosteamlogon-deduction/failed-retvals.png
     image_path: /assets/images/blog/2026-06-10-nosteamlogon-deduction/failed-retvals.png
---
Buat yang sering main sourcegame pasti pernah mengalami keluar dari server kurang dari satu menit setelah *join* dan muncul tulisan *No Steam Logon*.

Aku belum mempuyai definisi teknis untuk No Steam Logon, namun setelah menjalankan server L4D2 selama sebulan ini aku bisa mendapatakan deduksi kenapa No Steam Logon ini terjadi di sisi server.

# Match Making System
Pertama dimulai dengan membahas Match Making System, untuk L4D2 pemain bisa menggunakan fitur quick connect untuk bergabung dengan server yang sedang berjalan ataupun membuat lobbynya sendiri. Ketika membuat lobby pemain yang membuat lobby akan disambungkan dengan server kosong yang tersedia. 

Setelah mendapatkan server yang kosong Steam akan membuatkan *match* game yang telah ditentukan dan memberikan cookies ke server yang berjalan, cookies ini mirip dengan cookies yang ada di browser yang menyimpan data dari pemain yang di dalamnya dan fungsi lainnya adalah membuat match making bagi pemain yang bergabung lewat quick connect dengan ini server bisa penuh dengan pemain.

{% include gallery caption="Diagram how to make and connect to server from my knowledge" %}

# Cookies Problem
Dari cookies ini lah masalah No Steam Logon akan muncul, pemain yang pertama kali join akan di cek Steam IDnya dan ketika di cek Steam Server tidak mendapatkan Steam ID dari pemain yang join maka pemain tersebut akan dikeluarkan dari server dalam kurun waktu satu sampai satu setengah menit.

{% include gallery id="gallery2" caption="Picture to the left is diagram and to the right is what server see when failed to retrieve player Steam ID" %}

Selain itu cookies ini juga yang membuat banyak server Cina berada di server, ini hanya pendapat ku kalau admin dari Steam Group ini sengaja tidak menonaktifkan cookies nya sehingga pemain yang bergabung lewat *quick connect* akan disapa dengan server yang penuh mod sehingga banyak pemain yang join dan terjebak di dalam server tersebut, setelah merasa tidak ada lagi server yang normal maka terpaksa untuk bermain di server Cina.

# Hal yang bisa dilakukan pemain
Beberapa hal yang bisa kamu lakukan ketika mendapatkan No Steam Logon:
1. Keluar dari Game, ini karena jika kamu join lagi kamu akan mendapatkan pesan yang sama berulang kali karena secara tidak langsung game yang sedang berjalan menyimpan status terakhir mu dan untuk *reset* maka keluar dari game. 
Kemudian hindari server yang memberikan mu No Steam Logon biasanya server ini baru berjalan dan aku merasa perlu beberapa lama sampai server ini bisa dimainkan tanpa memberikan No Steam Logon.
2. Restart Steam, di beberapa artikel di internet juga memberikan saran untuk restart steam. Aku merasa ini tidak perlu dilakukan jika server yang ingin kamu gabung tidak memiliki cookies sehingga kamu bisa join langsung lewat serverbrowser atau list steam group.

# Hal yang bisa dilakukan admin


Di sini juga aku bisa bercerita tentang pain yang aku dapatkan selama setup server dan harus menghadapi no team logon di server ku sendiri
