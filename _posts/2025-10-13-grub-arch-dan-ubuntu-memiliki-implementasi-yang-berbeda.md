---
date: 2025-10-14
categories: blog
tags: linux devops kernel
---
Pada [post sebelumnya]({% post_url 2025-10-11-i-was-right-all-along %}) aku ingin dedikasi kan waktu luang ku untuk memperdalam DevOps. Ada beberapa cara untuk untuk mempelajari Sistem Administrasi dan DevOps antara lain:
1. Menyewa VPS atau Cloud Hosting, opsi ini pernah aku dapat di tahun 2024 dengan provider Alibaba Cloud lewat program Alibaba Student dengan memberikan satu tahun akses cloud hosting. Waktu itu spek yang diberikan adalah 2Gb RAM dengan 1 Core pernah kupakai ketika waktu magang untuk deployment Laravel Proyek.
2. HomeLab atau Self Hosting, dengan menggunakan komputer yang tidak dipakai dibanding dibuang dan menjadi *[E-Waste](https://www.who.int/news-room/fact-sheets/detail/electronic-waste-%28e-waste%29)* lebih baik instal sistem operasi seperti Linux atau Promox, ditambah Windows 10 sudah mau EOS pada bulan Oktober 2025.

Konfigurasi yang kupakai adalah laptop yang memiliki Intel Celeron 2 Core dengan RAM yang sudah di-*upgrade* dari 2GB -> 4GB lalu 256GB SSD ini akan menjadi homelab sekaligus daily driver ku kedepan karena aku sudah bosan memakai Windows selama kuliah, untuk sistem operasi memakai turunan dari Arch yaitu [CachyOS](https://cachyos.org/) - aku bisa install Arch tapi aku ingin mencoba Cachy untuk *build* berikutnya - kemudian membuat partisi lain yang berisi Ubuntu Server 25.10 untuk simulasi lingkungan *deployment* 

Aku tidak akan menjelaskan proses instalasi dari kedua OS tersebut yang ingin aku bahas adalah kasus dimana salah satu OS tidak terdeteksi dengan GRUB, GRUB adalah [boot manager](https://www.rodsbooks.com/efi-bootloaders/principles.html) yang memberikan tampilan ketika komputer telah boot untuk memilih sistem operasi yang ingin dipakai. GRUB juga berfungsi sebagai boot loader yang mengatur kernel dan parameter lain yang dibutuhkan untuk masuk ke dalam sistem operasi.

Dalam instalasi pertama ku mulai dengan Cachy dengan GRUB sebagai boot manager setelah instalai selesai kemudian masuk ke dalam OS untuk memastikan semua berjalan, setelah itu aku masuk lagi ke live install CachyOS dan membuat partisi lain dengan [fdisk](https://wiki.archlinux.org/title/Fdisk) lalu membagi partisi menjadi tabel ini:

```sh
/dev/sda # nama SSD yang terpasang
	/dev/sda1 # Boot loader dari CachyOS
	/dev/sda2 # Instalasi CachyOS
	/dev/sda3 # Instalasi untuk Ubuntu Server
```

Pada `/dev/sda3` aku memberikan kapasitas 50G dan me-*reboot* laptop untuk memulai instalasi Ubuntu Server. 

Prosesnya sama dengan Cachy yang berbeda tidak adanya GUI, ketika masuk ke dalam partisi aku memilih manual dan disajikan pilihan *driver* dari USB Stick dan SSD - aku lihat ada 3 partisi yang tersedia sda1, sda2, sda3, aku pilih sda3 untuk instalasi Ubuntu Server ketika masuk ke **mount point** aku belum tahu partisi Ubuntu ini mau dipasang di mana pertama kupikir di direktori `/dev/sda` tapi bagaimana cara mountnya kemudian pilihan lain adalah root direktori `/`. Aku memilih root direktori karena waktu itu kupikir bakal membagi *bootloader* antara Cachy dan Ubuntu.

Setelah *reboot* laptop langsng masuk ke dalam Ubuntu Server melewati boot manager milik Cachy, setelah masuk ke dalam tty aku terpikir dengan paket os-probe yang digunakan untuk dual-booting Linux dan Windows, aku mengikuti prosedur Arch Install dengan membuat direktori sementara dan mount direktori tersebut ke dalam `/dev/sda2` yang berisi Cachy lalu mengubah file `/etc/default/grub` dan mengaktifkan opsi ini `GRUB_DISABLE_OS_PROBER=false` di dalam GRUB dan terakhir menjalankan perintah `sudo update-grub` dan mendeteksi instalasi dari Cachy tapi yang kulihat itu bukanlah kernel milik Cachy namun milik Ubuntu - akan ku beritahu di akhir. Setelah itu `umount /dev/sda2` dan mengecek blok device yang ada dengan `lsblk -l` dan melihat bahwa *mountpoint* root direktori berpindah dari `/dev/sda2` menjadi `/dev/sda3`.

Setelah *reboot* instalasi Cachy masih tidak terdeteksi dengan **GRUB milik Ubuntu**, lalu aku coba masuk ke Cachy live install dan chroot ke dalam `/dev/sda2` - Cachy memiliki fungsi bernama cachy-chroot untuk kebutuhan chroot. Dengan prosedur yang sama ada satu hal ku perhatikan yaitu di dalam
`/etc/default/grub` opsi ini `GRUB_DISABLE_OS_PROBER=false` berada di baris akhir dengan definisi yang berbeda. Setelah itu aku coba *reboot* kembali dan Ubuntu Server belum deteksi kernel milik Cachy.

Sebelum aku mencoba lebih banyak lagi aku coba cari di internet tentang isu ini dan menemukan beberapa forum yang memiliki masalah serupa, dari [forum arch](https://bbs.archlinux.org/viewtopic.php?id=288537) seorang pengguna melaporkan bahwa Arch installnya tidak terdeteksi oleh GRUB Ubuntu dan memutuskan untuk install GRUB di Arch untuk mengatur boot loader di komputernya lalu lewat [forum endevouros](https://forum.endeavouros.com/t/you-cannot-start-an-arch-based-distribution-from-ubuntu-grub/6328/14) mengatakan bahwa implementasi GRUB milik Arch dan Ubuntu berbeda sama halnya di forum Arch bahwa GRUB milik Ubuntu versinya lebih tua dibanding Arch. Dengan petunjuk ini aku ingin mencoba membuat lingkungan test untuk melihat implementasi yang cocok untuk dual boot Arch dan Ubuntu. 

Testing akan dilakukan di dalam Virtual Box, ada beberapa skenario yang terpikir antara lain:
- Mengganti Mount Point pada blok device, aku perhatikan Ubuntu menjadi mountpoint untuk root bukan Arch jadi aku penasaran apakah akan membuat OS corrupt karena perbedaan package managemetnya.
- Mencoba Mountpoint yang berbeda ketika install Ubuntu server, karena tidak ada pilihan "install along side" di dalam installer milik Ubuntu Server, jadi aku masih meraba mountpoint yang benar di mana. 
- Menambah Arch install di dalam Cachy, terkesan redudan dengan memakai Arch untuk server, namun aku ingin mensimulasikan pengalaman VPS seperasi antara Dekstop Environment dengan tty.
- Menggunakan Boot Manager yang berbeda, ini hanya bisa dilakukan dengan Arch dan turunannya sedangkan Ubuntu menggunakan GRUB secara bawaan. Tapi akan menjadi hal yang menarik untul dilihat.
- Menambah Custom Kernel, saran ini terlintas pada Forum dengan menambah custom kernel di dalam GRUB. Di paragraf sebelumnya aku sebut bahwa kernel milik Cachy berbeda dengan Ubuntu - Cachy kernel bernama 6.17-linux-cachyos sedangkan kernel Ubuntu adalah 6.17-generic. 

Hipotesis ku adalah ketika memindahkan root direktori ke Ubuntu Server, GRUB milik Ubuntu menimpa milik Cachy sehingga menggunakan GRUB milk Ubuntu seharusnya jika mountpointnya bukan di root akan menggunakan GRUB milik Cachy dan kernel milik Ubuntu akan terdeteksi karena itu aku ingin testing skenario ini lewat Virtualbox.
Apapun hasilnya nanti aku akan buatkan blog dan mendokumentasikan hasilnya, untuk kedepan aku ada beberapa proyek yang bisa kucoba dan aku ingin lihat hal apa yang bisa ku *break* berikutnya.  



