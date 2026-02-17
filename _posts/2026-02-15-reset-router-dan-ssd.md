---
title: Format SSD dan Reset Router 
category: blog
tags: hardware router ssd
--- 
Selama weekend kemarin aku berencana untuk format SSD dan reset router rumah, waktu mengganti sistem operasi ke Arch Linux aku upgrade SSD bawaan laptop menjadi 1Tb, bulan kemarin aku dengar dari teman kantor bahwa mereka perlu SSD untuk transfer data. Mereka sudah meminta penyimpanan ke atasan tapi belum ditangggapi, aku berniat untuk meminjam kan mereka SSD lama ku dan memberinya rumah baru berupa *enclosure*. 

Selain SSD hal yang aku format juga adalah Router Rumah, alasan aku format karena waktu itu aku pernah mengganti password dan lupa passwordnya, karena selama 6 tahun terakhir masih memakai username dan password bawaan. Sebenarnya aku bisa tetap pakai tanpa perlu reset namun aku menemukan dua hal yaitu:
1. Ping Wifi ku sekarang ampas, dulu biasanya tetap stabil di ping yang rendah sekarang naik dan turun sehingga tidak stabil untuk *gaming*.
2. Aku ingin memakai LAN dan DNS, solusi untuk ping rendah adalah memakai kabel LAN namun entah kenapa LAN di router ku tidak bisa dipakai dan aku pikir penyebabnya adalah belum di konfigurasi di router panelnya. Konfigurasi DNS di router adalah hal baru karena selama awal Februari aku sedang eksplore DNS setup secara local jadi memiliki opsi ini pada router bisa menjadi bahan belajar ku kedepannya.

Dari kedua hal tersebut yang memiliki resiko tinggi adalah router karena jika aku gagal konfigurasi aku tidak bisa akses internet tidak hanya diriku saja keluargaku akan terkena dampaknya, sedangkan format SSD walaupun memiliki banyak data kebanyakan data tersebut adalah sampah dari Windows dan Aplikasi yang sudah tidak aku pakai lagi, sedangkan user data seperti dokumen, gambar, musik, dan video sudah aku *backup*.

# Format SSD
Semenjak memakai Linux aku akrab dengan command `mount`, `mount` berfungsi untuk menaruh Disk Drive atau ISO ke dalam directory untuk diakses. Direktori ini bisa seperti `/mnt/ssd` ataupun ku `/run/media/`. Mount juga bisa dilakukan otomatis oleh File Manager seperti Thunar maupun Dolphin. Untuk kasus ku *enclosure* yang aku beli adalah [Lexar E6](https://tk.tokopedia.com/ZSmBXAEuy/) dan didalamnya ada obeng kecil, thermal pad, dan *enclosure* untuk SSDnya, proses pemasangannya mudah dan terdapat instruksinya setelah pemasangan aku pasasng di laptop dan Lexar E6 terdeteksi di direktori `/run/media` dan di partisi ke 3 semua data data ku berada. Windows ketika instalasi membuat 4 partisi pertama adalah partisi 1 untuk booting, partisi 2 reserved, partisi 3 untuk Windows, dan partisi 4 aku lupa apa fungsinya. 

Sebelum aku format aku coba cek kecepatan dari transfer datanya dalam keadaan dingin bisa mencapai 500Mb/s sedangkan ketika panas turun menjadi 45-50Mb/s. Aku belum tahu kenapa bisa cepat panas SSD, dari dulu selama aku pakai pun gampang panas terutama ketika transfer data.

Sebelum aku format aku hapus semua partisi yang dibuat oleh Windows dengan perintah `sudo fdisk /dev/sdxY` dan membuatnya hanya menjadi satu partisi dari sektor awal hingga akhir. Setelah selesai aku format dengan file sistem NTFS karena jika aku pakai ext4 bahkan BTRFS laptop teman ku yang pakai windows tidak bisa deteksi SSD ku ini. 

Penamaan volumenya aku terinspirasi dari [redditor avguru1](https://www.reddit.com/r/editors/comments/7jd83a/what_do_you_name_your_hard_drives/) karena deskriptif pernamaan nya command sendiri kalau di Linux adalah `sudo mkfs.ntfs -Q -L /dev/sdxy` Opsi -Q untuk quick format dan -L untuk Label atau nama yang ingin diberi kepada disk. Setelah selesai aku mount lagi ke `/run/media` ataupun `/mnt/ssd` untuk *testing* lebih lanjut.

Biasanya aku `preserve` hal hal yang waktu dulu sulit aku dapatkan sepeti SSD ataupun Data Pribadi namun selama proses format SSDnya aku beneran ingin menghapus semua karena aku sudah backup data pribadi dan tidak ada lagi hal hal dari Windows yang akan membuat ku kembali lagi.

# Factory Reset Router
Bagiku format SSD penuh data selama 5 tahun bukanlah perkara besar sedangkan reset router rumah kembali ke awal ketika penarikan kabel adalah perkara yang sulit, jika aku gagal maka aku tidak bisa memakai internet dan kedua jika aku salah langkah maka aku bisa membuang buang waktu hubungi CS dan berharap teknisi datang ke rumah. Aku sudah melihat video tentang proses reset router dan menggambarkan skenario ketika proses konfigurasi SSID Wifi dan LAN, namun halangan terakhir adalah perasaan jika gagal apa yang akan terjadi tapi aku sudah punya [mentalitas yang diperlukan]({% post_url 2026-02-02-refleksi-2025-dan-harapan-2026 %}) buat menghadapi resiko itu jadi **F--- it, we balls.**

Percobaan pertama aku gagal melakukan factory reset, routernya masih menggunakan SSID yang lama dan aku masih belum bisa akses router panel. Dugaanku aku tidak menekan tombol resetnya lebih lama, aku mengikuti instruksi di manual yaitu perlu menahannya lebih dari 10 detik dan lepas kemudian tunggu lampu WLAN dan PON nya mati lalu hidup kembali yang menandakan reset berhasil. Pada percobaan ini routernya hanya reset tapi tidak kembali ke setelan pabrik, karena aku masih ragu buat mencoba lagi jadi aku tahan dulu sambil mencari metode lain.

Percobaan kedua aku pakai metode dari [video ini](https://youtu.be/Ctwm654QkkI) yaitu tekan tombolnya dua kali, yang pertama hanya tahan sedetik, lalu yang kedua tahan selama 15 detik. Kali ini aku tahan sampai 15 detik dan baru dilepas, lampu WLAN dan PON nya mati lalu hidup kembali ketika aku buka WIFI Handphone langsung terlihat SSID bawaan dari router yang menandakan factory resetnya berhasil. 

Hal yang ku khawatirkan adalah tidak bisa akses Wifinya karena WLAN keynya salah namun tidak terbukti dan aku langsung akses router panel dan mengganti SSID dari Wifi dan WLAN keynya menjadi seperti dulu. Dan kali ini aku pastikan LAN Configurationnya jalan dan DHCPnya sesuai dan akhirnya aku bisa memakai LAN ku kembali.

Kedepannya aku ada rencana untuk membeli access point atau switch untuk membagi beban dari router, jadi router dari ISP berfungsi sebagai WAN dan WIFI ataupun LAN memakai router yang lain walaupun aku rasa belum perlu karena rumahku belum dua lantai. Untuk SSD akan menjadi tempat ku backup data pribadi kedepannya dan bisa menjadi perantara yang bagus untuk berbagai data dari Hanphone ke Laptop karena menggunakan kabel type C untuk koneksinya.
