---
date: 2026-04-16
title: "Pain and Suffering melakukan deployment dengan Podman"
category: blog
tags: podman container docker
---
Ide menggunakan Podman sudah ada semenjak awal magang yaitu ketika ditanya mentor kelebihan menggunakan Podman daripada Docker saat mencoba *deployment*, aku jawab Podman itu *rootless* dan *daemonless*. Kedua istilah tersebut aku belum pahami dengan benar sampai aku mencoba melakukan deployments dengan Podman.

Aku mencoba Podman setelah menyewa VPS untuk dipakai sebagai homelab serta ingin self-hosting beberapa service yaitu: Git Server, Game Server (Minecraft, L4D2), dan Blog. Dari ketiga service itu aku mencoba deploy Git Server karena selama magang ini aku sudah memakainya untuk melakukan CI/CD Workflow sehingga aku sudah familiar dengan cara kerja Container serta Docker, kemudian menjadi kesempatan mencoba teknologi Podman yang kata beberapa orang bisa menjadi *drop-in-replacement* dari Docker - semudah menambahkan `alias docker=podman` pada shell rc.

Pililhan Self Hosting Git Server tiga yaitu: [Gitlab](https://docs.gitlab.com/install/requirements/https://docs.gitlab.com/install/requirements/), [Gitea](https://docs.gitea.com/), dan [Forgejo](https://forgejo.org/). Dari ketiga pilihan tersebut selama aku magang ini aku menggunakan Gitea karena Gitea Action mirip dengan Github Action Workflow dari Syntax serta Actions yang bisa dipakai lalu aku juga ingin mencoba Forgejo yang memiliki klaim 100% **Free Open Source Software**.

# Introduction
Instalasi Podman pada Linux lebih mudah dibandingkan Docker:
```bash
sudo apt-get update
sudo apt install -y podman
```
Podman secara bawaan bisa langsung dipakai oleh user karena sifatnya yang *rootless* dan Podman menyediakan opsi *rootful* jika ingin akses pada directory root dengan perintah `sudo`. Perlu dicatat bahwa *rootful podman* tidak berbagai resource dengan *rootless* Podman jadi ketika *rootless* Podman mengambil image dari registry maka image tersebut tidak akan ada di *rootful* Podman. 

Deployment Git Server yang aku buat di laptop ini menggunakan Docker Compose sedangkan Podman tidak memiliki hal yang sama, aku sekilas lihat ada Podman Compose namun aku baca lewat Reddit secara fungsionalitas belum sesuai dengan Docker Compose namun di thread yang lain aku membaca tentang Quadlets. Aku kutip dari [Blog Redhat](https://www.redhat.com/en/blog/quadlet-podman) bahwa:

> Quadlets adalah cara mengatur container secara deklratif pada systemd, mirip dengan Kubernetes

Jadinya dengan Quadlets bisa mengatur container dengan systemd unit dan membuat lebih mudah diatur, kebetulan aku ingin eksplorasi maka mencoba Quadlets dari Podman termasuk tantangan ku dan hal pertama yang ingin aku buat container adalah Reverse Proxy. 

# Caddy Server 
Selama magang aku menggunakan Nginx untuk reverse proxy namun jika ingin dibuatkan container rasanya sulit untuk mengatur SSL Certificate dengan Certbot, alternatif lain adalah [Caddy](https://caddyserver.com/). Caddy secara bawaan sudah mendukung HTTPs dan secara otomatis memperbarui sertifikat SSL lalu di dalam dokumentasinya sudah ada Docker Compose, karena aku ingin memakai Quadlets maka harus ubah yaml file tersebut menjadi systemd unit yang bisa dipakai oleh Podman Quadlets. 

Aku mengikuti tutorial dari blog milik [eshlox](https://eshlox.net/run-the-caddy-server-on-fedora-using-podman) bagaimana menyiapkan Caddy Server dengan Podman, pada  dokumentasi Caddy disebutkan untuk binding port 80 dan 443 ke dalam Caddy container sedangkan Podman itu daemonless jadi untuk akses port tersebut perlu *[privileged user](https://www.w3.org/Daemon/User/Installation/PrivilegedPorts.html)*. 

Aku sudah mencoba menggunakan [port lebih tinggi](https://caddyserver.com/docs/quick-starts/caddyfile#:~:text=%28If%20you%20get%20permission%20errors%2C%20you%20may%20need%20to%20run%20with%20elevated%20privileges%20or%20choose%20a%20port%20higher%20than%201023%2E%29) dan redirect ke port 80 dan 443 namun masih belum bekerja. Aku akui masih belum tahu bagaimana cara kerja firewall dan fungsi fungsi apa yang bisa kupakai untuk memastikan bahwa traffic yang masuk bisa lebih aman jadi itu menjadi PR ku nanti. Akhirnya aku pasang Caddy Container dengan *root privileges* di directory `/etc/containers/systemd` kemudian binding ke port 80 dan 443. 

Tapi kesulitan itu belum selesai karena aku baru pasang container Caddy Server namun aku masih belum tahu bagaimana cara kerja Caddy dalam menghadirkan website kepada *user* ditambah aku menggunakan container dan bukan *binary* yang disediakan oleh package manager yang menambah kompleksitas dari file sistem. Namun aku tetap mempelajarinya karena dari awal aku ingin setup Homelab ku di VPS ini menggunakan Container tanpa adanya package tambahan yang diinstall.

Caddy menggunakan Caddyfile untuk mengatur bagaimana website itu disediakan mirip dengan Nginx Conf, awal mula yang membuat ku pusing adalah port dan IP. Pada dokumetansi Caddy untuk menyediakan website hanya perlu syntax seperti ini:

```nginx
localhost {
    respond "Hello,World"
}

localhost:8080 {
    respond "Hello,World"
}
```
Yang membuat ku mati kutu adalah ketika aku mencoba `curl` untuk mendapatkan respond selalu mendapatkan respon server tidak bisa diakses. Pas aku coba gali ternyata localhost pada container hanya bisa diakses **DI DALAM CONTAINER** bukan di mesin yang menjalankan container, lalu bagaimana menyediakan static website di dalam Container dari volume binding karena jika menggunakan binary maka bisa diakses lewat `/var/www/html` sedangkan lewat Container aku belum terbayang cara melakukannya.

Setelah berjuang memahami cara kerja Caddy, berikutnya adalah membuat Git Server dengan Podman. Aku hanya mengubah konfigurasi saat ini dari Docker Compose menjadi Quadlets, yang menjadi tantangan adalah bagaimana konfigurasi untuk *reverse proxy* dengan Caddy. Beberapa hal yang belum aku ketahui ketika menggunakan Caddy sebagai container antara lain apakah harus menggunakan network host untuk container namun tidak ada isolasi oleh Container, lalu menaruh Gitea Container secara *rootful* karena aku belum tahu apakah Container Caddy bisa berkomunikasi dengan Gitea jika aku letakan di *rootless*, dan terakhir bagaimana melakukan reverse proxy dengan Caddyfile.

# Git Server
Aku *trial and error* memakai Caddy Server sampai akhirnya berhasil memakainya sebagai *reverse proxy* aku mungkin akan buatkan blog nya sendiri, berikutnya adalah menyiapkan Git Server. Untuk Git Server aku pertama mencoba Gitea karena sudah ada Docker Compose filenya dan aku sudah familiar dengan konfigurasinya, setelah *deploy* Gitea dan melakukan instalasi Gitea. Berikutnya adalah membuat Gitea Action pada tahap ini aku belum tahu kalau Gitea [tidak mendukung Podman Socket](https://chrisapproved.com/blog/gitea-on-fedora-linux-with-podman.html) lucunya adalah di dokumentasi Gitea untuk menjalankan Gitea Runner perlu menggunakan Docker Socket aku binding volume di container Gitea Runner dengan podman socket seperti ini:
```systemd
Volume=/var/run/podman/podman.sock:/var/run/docker.sock
```
Saat kulihat logs Gitea Runner bisa ping dengan docker daemon dan akhirnya aku mencoba menjalankan runner di dalamnya, sayangnya image yang dipakai oleh Gitea Runner tidak bisa terhubung dengan Docker Socket dugaan ku karena Docker API dari Gitea Runner tidak mengenali Podman Socket. Dengan begitu aku pikir untuk mencoba actions untuk Podman yang dibuat oleh Redhat, memakai itu pun ternyata tidak bisa karena tidak terinstall Podman tapi sekalipun aku coba install Podman di dalam runner ternyata juga buntu.

Dengan begitu aku install Docker pada VPS dan memakainya untuk pada Gitea Runner, setelah selesai dengan Gitea aku mencoba Forgejo karena di dokumentasi [Forgejo mendukung Podman](https://forgejo.org/docs/latest/admin/actions/runner-installation/#:~:text=Podman%3A%20Podman%20provides%20a%20%28generally%20compatible%29%20Docker%20CLI%20and%20Socket%2E) kurang lebih proses yang sama ku alami oleh Gitea namun lebih sulit lagi karena `config.yaml` bawaan perlu di ubah untuk bisa mendukung volume binding dengan Forgejo Action karena secara bawaan mereka tidak mendukung `/var/run/docker.socket` (Catatan buat diriku untuk tidak menggunakan default kedepannya) lalu Forgejo entah kenapa tidak bisa di ping oleh Caddy Server di *rootful* sedangkan ketika berada di *rootless* environment bisa di ping.

# Resolution
Dari awal konfigurasi VPS menggunakan sistem container baru, mencoba reverse proxy baru, sampai menggunakan git server yang baru memang pain and suffering selama 1 minggu untuk membuat setiap komponen ini bekerja tapi setelah membaca dokumentasi berulang kali, mencoba berbagai setup, akhirnya aku bisa membuat semua sistem yang kupakai bekerja dan puas bisa menaklukan tantangan baru dengan Podman.

Podman buatku menjadi opsi yang menarik karena integrasi nya dengan systemd dan Podman memiliki fitur [auto-update](https://www.redhat.com/en/blog/podman-auto-updates-rollbacks) yang menarik untuk dicoba.

Tantangan berikutnya adalah mengubah konfigurasi ku saat ini menjadi Kubernetes Cluster, Podman memiliki Podman Kube jadi aku bimbang apakah menggunakan Kubernetes seperti k3s atau dari Podman.


