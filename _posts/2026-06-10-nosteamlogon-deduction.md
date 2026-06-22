---
date: 2026-06-22-22:26:36 +0700
title: Penyebab No Steam Logon dari sisi administrasi
excerpt: "No Steam Logon is error from client side where player got kicked from server because steam can't verfied their Steam ID. This blog explaing why it happen and how player and admin can work around this problem"
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
gallery3:
   - url: ../assets/images/blog/2026-06-10-nosteamlogon-deduction/server-with-cookies.png
     image_path: ../assets/images/blog/2026-06-10-nosteamlogon-deduction/server-with-cookies.png
   - url: ../assets/images/blog/2026-06-10-nosteamlogon-deduction/server-with-no-cookies.png
     image_path: ../assets/images/blog/2026-06-10-nosteamlogon-deduction/server-with-no-cookies.png
  
---
Buat yang sering main sourcegame pasti pernah mengalami keluar dari server kurang dari satu menit setelah *join* dan muncul tulisan *No Steam Logon*.

Aku belum punya definisi teknis untuk No Steam Logon, namun setelah menjalankan server L4D2 selama sebulan terakhir aku bisa mendapatakan deduksi kenapa No Steam Logon ini terjadi di sisi server.

# Match Making System
Pertama dimulai dengan membahas Match Making System, pada sourcegame pemain bisa menggunakan fitur quick connect untuk bergabung dengan server yang sedang berjalan ataupun membuat lobbynya sendiri. Ketika membuat lobby pemain akan disambungkan dengan server yang tersedia. 

Setelah mendapatkan server yang tersedia Steam akan membuatkan lobby untuk pemain dan memberikan cookies ke server yang sedang berjalan, cookies ini mirip dengan cookies di browser yaitu menyimpan data dari pemain yang ada di server dan fungsi lainnya adalah membuat match making bagi pemain yang bergabung lewat quick connect.

{% include gallery caption="Diagram how to make and connect to server based on my knowledge" %}

# Cookies Problem
Dari cookies masalah No Steam Logon akan muncul, pemain yang join ke server akan di cek Steam IDnya. Ketika di cek Steam Server tidak mendapatkan Steam ID dari pemain yang join maka pemain akan dikeluarkan dari server dalam kurun waktu satu sampai satu setengah menit.

{% include gallery id="gallery2" caption="Picture to the left is diagram and to the right is what server see when failed to retrieve player Steam ID" %}

Selain itu cookies ini juga yang membuat banyak third party server berada di publik, ini hanya pendapat ku pribadi kalau admin dari Steam Group ini sengaja tidak menonaktifkan cookies nya sehingga pemain yang bergabung lewat *quick connect* akan bergabung dengan server yang penuh mod sehingga banyak pemain yang join dan terjebak di dalam server, setelah merasa tidak ada lagi server yang normal maka terpaksa untuk bermain di server tersebut.

# Hal yang bisa dilakukan pemain
Beberapa hal yang bisa kamu lakukan ketika mendapatkan No Steam Logon:
1. Keluar dari Game, ini karena jika kamu join lagi kamu akan mendapatkan pesan yang sama berulang kali karena secara tidak langsung game yang sedang berjalan menyimpan status terakhir mu dan untuk *reset* maka keluar dari game. 
Kemudian hindari server yang memberikan mu No Steam Logon biasanya server ini baru berjalan dan aku merasa perlu beberapa lama sampai server ini bisa dimainkan tanpa memberikan No Steam Logon. 
Cara lainnya adalah meminta teman membuat ku servernya terlebih dahulu sebelum kamu join.
2. Restart Steam, di beberapa guide di internet memberikan saran untuk restart steam. Aku merasa ini tidak perlu dilakukan jika server yang ingin kamu gabung tidak memiliki cookies sehingga kamu bisa join langsung lewat serverbrowser atau list steam group.

Kamu bisa cek server memiliki cookies atau tidak dengan mengetik status di dalam console, jika ada tulisan *unreserved* maka server tersebut tidak memiliki cookies

{% include gallery id="gallery3" caption="Left is Server with Cookies and Right is server without Cookies" %}

# Hal yang bisa dilakukan admin
Menggunakan *extension* berupa [l4dtoolz extension](https://github.com/lakwsh/l4dtoolz) yang bisa memberikan kapabilitas server untuk membuka slot sampai 32, salah satu fitur dari extension ini adalah *sv_force_unreserved* jadi membuat server tidak menerima permintaan pembuatan lobby dari pemain sehingga tidak mendapatkan cookies dari Steam dengan begitu bisa mencegah pemain mendapatkan No Steam Logon.

Ini adalah *pain* yang kurasakan selama 2 minggu testing server baik itu lokal maupun *production* setiap kali ingin testing plugins atau mod pasti akan mendapatkan no steam logon sehingga kesal rasanya ditendang dari server sendiri, namun biasanya masalah akan selesai sendiri jika server selalu up time dan bisa dimainkan oleh pemain dan mungkin Steam menandai server ini aman untuk dipakai.

Penyebab lain yang jarang terjadi adalah koneksi internet yang tidak stabil. Pada awalnya aman ketika bermain namun saat mendapatkan sinyal yang jelek bisa menggangu stabilitas pemain dan akhirnya menyebabkan No Steam Logon karena pemain gagal mengirim Steam ID kepada Steam Server.

Dan sayangnya ini terjadi kepada salah satu pemain survival, waktu itu dia dengan rekan tim lainnya mencoba mendapatkan World Record di map c10m4_mainstreet atau Death Tool - Street. Ketika di penghujung game tiba tiba koneksinya terputus dan pesan yang muncul di log chat adalah *disconnected(No Steam Logon)* dan ketika login kembali dia tidak mendapatkan recordnya, record terbaru adalah 582 Minutes atau hampir 10 Jam.

