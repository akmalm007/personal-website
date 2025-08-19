---
layout: single
---
Perlu 3 hari buat reconfigure nvimrc ku dari awal setelah satu setengah tahun tidak di update. Jarang ku update karena masih bagus dan bisa dipakai buat ngerjain skripsi, akhir akhir ini kerjain project baru dan ada behavior yang aneh karena penasaran kucoba investigasi. 

Behaviornya itu ketika autoformat on save harusnya bisa jaga format dari source code ketika filenya di save justru formattingnya salah dan karena ini aku sempet stuck ketika ikuti dokumentasi framework yang lagi kupakai selain itu ada warning seperti fungsi yang deprecated dan Neovim suka keluar sendiri, kupikir buat config ulang Neovim karena merasa LSPnya udah outdated dan banyak fitur plugin yang tidak bisa dipakai lagi.

Aku google [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) dan salah satu video Yt buat config Neovim di 2025, setup ku sebelumnya pake video dari [Primeagen](https://youtu.be/w7i4amO_zaE?si=wBBQa8UCZPE3mtkQ) dan videp ini dirilis tahun 2022 dan waktu terakhir aku buat config itu tahun 2023 (udah lama juga). Aku mulai dengan build Neovim dari source karena pakai package manager Ubuntu WSL2 outdated di versi 0.9, aku clone kickstart.nvim di home directory dan ikutin juga video tutorial config buat ingat lagi apa yang perlu disiapkan. Secara esensi kalau ingin buat neovimrc itu harus ada init file buat setup point kemudian lua directory di sini tempat buat menaruh plugin file, keymaps, dan setting dari Neovim. 

Selama kemarin yang makan banyak waktu itu compiling Neovim karena ada depedency yang error kemudian memilih colorscheme, atur settingan Neovim agar sama dengan sebelumnya, dan setup LSP buat Neovim. Terutama LSP karena enaknya VScode adalah LSPnya itu mudah di install dengan extension seperti Python atau JS sedangkan Neovim pertama harus download repo yang berisi LSP Client buat Neovim untuk bisa berkomunikasi dengan LSP Server kemudian panggil function buat call LSP Server di dalam file config dan terakhir install LSP server berdasarkan programming language yang dipakai, lalu jika ingin kemampuan lebih seperti autocompletion dan snippet maka install lagi cmp plugin.

Keperluan lain seperti File Tree dan Search File sudah ada dan Neovim sudah siap dipakai, buat kedepan perubahan akan berbentuk granular seperti opsi dari setiap plugin serta baca baca dokumentasi cara pakai setiap fungsinya. Berhubungan dengan developmen tools semenjak update neovimrc ingin update Tmux dan shell lagi lalu rasanya seperti kembali ke root dimana kebanyakan kerjaan dilakukan di dalam terminal lalu coba build software dari source itu pengalaman yang menarik.
Link
GIthub Repo: https://github.com/akmalm007/myneovimrc
Video: https://www.youtube.com/watch?v=KYDG3AHgYEs
tags: #neovim #lsp #linux
