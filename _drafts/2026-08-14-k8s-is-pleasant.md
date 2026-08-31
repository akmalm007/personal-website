---
date: 2026-08-14 14:07:31 +0700
title: Working with Kubernetes is much pleasant than SSHing to Server
category: blog
tags: kubernetes ssh linux
---
Dua minggu ini kan aku coba rollout deployment Kubernetes cluster di VPS dan pengalaman deploynya itu lebih enak dibandingkan pas pakai Container macam Podman Quadlets atau Docker Compose.

Pertama tidak perlu akses langsung ke server, Kubernetes kasih namanya Kubeconfig yang berisi data data tentang user, cluster, dan certificate. Kubeconfig ini dipakai Kubectl buat akses cluster seperti SIM buat izin memakai Cluster.

```
kubectl config view
```

Pada K3s dan Kubernetes cluster yang lain ada namanya SAN (Subject Alternative Name) ini bisa disetting untuk menambahkan IP yang bisa dipakai untuk di-*listening* ke Kubernetes Cluster, dan di VPS aku sudah menambahkan Wireguard untuk tunneling maka aku tinggal tambahkan IP di wireguard untuk menjadi SAN dan bisa konek ke Kubernetes Cluster tanpa perlu buka port di VPS untuk akses Kubernetes.

Kedua dengan kapabilitas auto completion, LSP, dan fuzzy finder yang ada di laptop lokal bikin deployment lebih gampang dan ini berbeda jika harus SSH langsung ke server yang mana bare bone, kemudian jika ingin install package lain bakal makan resource yang lain.

Lalu wiring service atau *microservices* di Kubernetes tidak sesulit yang dulu kubayang kan mungkin karena aku sudah tahu teori dibelakangnya. Pokoknya expose service dari north to south dan east to west lebih gampang dan alur nya pun jelas dibandingkan pakai networking option yang ada di container.


