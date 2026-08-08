---
date: 2026-08-06 20:12:41 +0700
title: Apa itu Kubernetes Cluster dan Jenis jenisnya
category: notes
tags: kubernetes network
number: 1
---
Apa itu Kubernetes? Kubernetes adalah alat orkestrasi container yang dipakai untuk manajemen Container di berbagai komputer/server/node di berbagai belahan dunia contoh Data Center. Kubernetes ini abstraksi infrastruktur komputer dari Sistem Operasi,Hardware,Network untuk menjalankan container dengan menyediakan API yang bisa dipakai untuk menjalankan workload tanpa peduli infrastuktur di bawahnya.

Kubernetes menyediakan Akses API interface dengan nama Kubectl bisa dibaca kube-C-T-L, kubecattle. Kubectl ini yang akan manajemen pod/container di dalam Kubernetes Cluster. Kubernetes bisa dilihat dari dua sisi pertama dari APInya yaitu kubectl lalu dari Clusternya, Cluster terdiri dari node atau komputer yang akan menjalankan serta manajemen pod di dalam cluster.

Node ini terdiri dari Control Plane dan Worker Node, Control Plane adalah API Server yang berkomunikasi ke Kubectl untuk bisa mengakses cluster. Setiap kali Kubectl membuat request ke dalam Cluster contohnya menjalankan game server, request tersebut akan ke masuk control plane kemudian instruksi akan diarahkan ke controller kemudian dilanjutkan ke scheduler. Dari Scheduler akan menugaskan node yang dipilih untuk mengolah request dari Kubectl setelah itu kubelet yang ada di Worker Node akan menjalankan Pod serta Resource lain untuk menjalankan Pod yang berisi Container dari game server yang sedang dijalankan.

Bagaimana Kubernetes membuat Cluster? bayangkan kalau Kubernetes itu adalah sistem operasi yang bisa mengatur banyak komputer untuk bisa dipakai, komponen yang dipakai untuk membuat komputer menjadi node antara lain Container Network Runtime, Storage dan Provisionernya, Linux Kernel serta Container Runtime. 

Dalam membuat Kubernetes Cluster bisa menggunakan [kubeadm](https://wiki.archlinux.org/title/Kubernetes) namun ini sudah seperti membuat infrastruktur dari awal maka dari itu Cloud Provider menyediakan opsi IaaS (Infrastructure as a Service) dan salah satunya adalah Kubernetes. Contohnya dari Cloud Provider itu macam GKE (Google Kubernetes Enginer) milik Google Clouds untuk level Enterprise selain dari Cloud Provider ada juga yang dikhususkan untuk perangkat IOT atau Homelab macam K3s ataupun untuk testing dan pengembangan aplikasi dengan KIND (Kubernetes in Docker) dan Minikube.

KIND menggunakan kubeadm untuk membuat cluster dengan Docker Container, container ini menjalankan komponen yang membuat kubernetes sehingga bisa mencontohkan bagaimana infrastuktur dengan node yang banyak. Sedangkan K3s modelnya berbeda yaitu single binary yang bisa menjadi server sekaligus worker lalu bisa menggabungkan komputer lain menjadi Agent atau Worker Node untuk ekspansi sumber daya.

Contoh dari KIND yaitu menggunakan docker container untuk menjalankan cluster dari kubernetes
insert image
Contoh dari K3s yang bisa menggabungkan dua komputer di network yang sama menjadi kubernetes cluster
insert image



