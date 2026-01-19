---
title: Menemukan Kapabilitas baru dari SSH
categories: blog
tags: ssh linux server coreutils
---
Biasanya ketika aku ingin melakukan *deployment* harus SSH ke server lalu mengotak-atik direktori dari project, biasanya akan terjadi dua hal antara ownership dari directory tersebut terganti karena menggunakan perintah `rsync -a` ataupun ada value dari dontenv berubah karena tidak sync dengan local ku.

Cara yang kulakukan masih manual dan nantinya akan terjadi kesalahan makanya itu 2 bulan terakhir mencari solusi untuk mempermudah proses *delivery* aplikasi. Solusi pertama adalah Gitlab Runner karena tim menggunakan Gitlab sayangnya harus verifikasi akun terlebih dahulu, lalu ingin menerapkan bash script tapi masih belum tahu cara mengirim perintah dari local ke remote server, dan saat ini sedang mencoba Gitea di local untuk mengembangkan CI/CD dan belajar lagi tentang CI. Kenapa tidak Jenkins? Jenkins rasanya ribet buat dikonfigurasi dan rasanya aku ingin sesuatu yang lebih dekat dengan Github Action karena itu Gitea *check the box*.

Baru pagi ini aku mencoba cari di DuckDuckGo cara mengirim perintah ke remote server menggunakan SSH, ada dua link yang kubuka pertama [Stackoverflow](https://stackoverflow.com/questions/18502945/how-to-execute-a-remote-command-over-ssh-with-arguments) dan kedua [GeeksforGeeks](https://www.geeksforgeeks.org/linux-unix/how-to-execute-commands-remotely-using-ssh-in-linux/). Implementasinya mudah dilakukan dan bisa menggunakan beberapa perintah sekaligus. Selama siang tadi coba kembangkan script dari perintah yang biasa aku pakai ketika deployment dan seperti ini contohnya.
```sh
docker build -t app:production .

docker save -o app.tar app:production

scp app.tar user@server:/home/user/

ssh -t user@server "cd /home/user;
docker load -i app.tar;
cd /home/user/project;
docker compose up -d;"
```
Ya aku tahu kenapa tidak pakai Container Registry untuk simpan image dan *pull* dari situ, sejujurnya aku ingin pakai tapi aku belum tanya apakah boleh push image ke repository. Apapun itu dengan cara ini akhirnya aku bisa buat script yang bisa automasi dan mendokumentasikan cara deployment karena aku pikir harus pakai CI tools untuk bisa melakukannya.

Selain itu aku menemukan ssh_config. ssh config ku temukan caranya ketika sedang setup Gitea di local, untuk pushnya aku ingin pakai SSH dengan public key di dalam localhost Gitea namun setiap kali ingin push selalu minta password padahal tidak aku siapkan. Setelah mencari solusinya ternyata portnya itu harus pakai 2222 kemudian User yang ada di dalam container menggunakan git dengan Hostname localhost, agar tidak repot mengetik perintah yang sama berulang kali - host dari remote server dan localhost aku definisikan di dalam direktori `$HOME/.ssh/config`. Cara lengkapnya ada di [guide ini](https://linuxize.com/post/using-the-ssh-config-file/), biasanya yang menggunakan alias seperti `ssh user@ip-address` bisa menjadi `ssh instance1`.

Aku yakin masih banyak command yang belum kucoba untuk membantu dalam bekerja, tapi aku yakin command, flag, options itu nanti bakal datang dengan sendirinya ketika aku membutuhkan seperti SSH ini datang di saat yang tepat. 


