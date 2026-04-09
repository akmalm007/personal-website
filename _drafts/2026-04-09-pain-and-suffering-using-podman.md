---
title: "Pain and Suffering melakukan deployment aplikasi dengan Podman"
category: blog
tags: podman container docker
---
Ide menggunakan Podman sudah ada semenjak awal magang yaitu ketika ditanya mentor kelebihan menggunakan podman daripada docker saat mencoba *deployment*, aku jawab Podman itu *rootless* dan *daemonless*. Kedua istilah tersebut aku belum pahami dengan benar sampai aku mencoba melakukan deployments dengan Podman.

Aku akhirnya mencoba Podman ketika menyewa VPS untuk dipakai sebagai homelab serta ingin hosting beberapa service yaitu: Git Server, Game Server (Minecraft, L4D2), dan Blog. Dari ketiga service itu aku mencoba deploy Git Server karena selama magang ini aku sudah memakainya untuk melakukan CI/CD Workflow sehingga aku sudah familiar dengan cara kerja Container serta Docker, kemudian menjadi kesempatan mencoba teknologi Podman yang kata beberapa orang bisa menjadi *drop-in-replacement* dari Docker - semudah menambahkan `alias docker=podman` pada .bashrc atau .zshrc.

Pililhan Self Hosting Git Server tiga yaitu: [Gitlab](https://docs.gitlab.com/install/requirements/https://docs.gitlab.com/install/requirements/), [Gitea](https://docs.gitea.com/), dan [Forgejo](https://docs.gitea.com/). Dari ketiga pilihan tersebut selama aku magang ini aku menggunakan Gitea karena Gitea Action hampir mirip dengan Github Action Workflow dari Syntax serta Actions yang bisa dipakai lalu aku juga ingin mencoba Forgejo yang memiliki klaim 100% **Free Open Source Software**.

Instalasi Podman pada distribusi Linux lebih mudah dibandingkan Docker dan berikut perintahnya:
```
sudo apt-get update
sudo apt install -y podman
```

Berbeda dengan Docker yang harus menambah keyring serta repository mereka di dalam APT package. 

Podman secara bawaan bisa langsung dipakai oleh user karena sifatnya yang *rootless* dan Podman menyediakan opsi *rootful* jika ingin akses pada directory root dengan perintah `sudo`. Perlu dicatat bahwa *rootful podman* tidak berbagai resource dengan *rootless podman* jadi ketika *rootless podman* mengambil image dari registry maka image tersebut tidak akan ada di *rootful podman*. 

Deployment Git Server yang aku buat menggunakan Docker Compose sedangkan Podman tidak memiliki hal yang sama, aku sekilas lihat ada Podman Compose namun aku baca lewat Reddit secara fungsionalitas belum sesuai dengan Docker Compose namun di thread yang lain aku membaca tentang Quadlets. Aku belum mendapatkan gambaran yang cocok untuk mendeskripsikan Quadlets tapi mengutip dari [Blog Redhat](https://www.redhat.com/en/blog/quadlet-podman):

> Quadlets adalah cara mengatur container secara deklratif pada systemd, mirip dengan Kubernetes


