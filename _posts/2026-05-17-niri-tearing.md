---
date: 2026-05-17 13:48:04 +0700
title: Niri support for Screen Tearing
excerpt: "Niri please add support for Tearing"
category: blog
tags: compositor niri l4d2 linux
header:
     image: /assets/images/blog/2026-05-17-niri-tearing/niri-tearing.png
     teaser: /assets/images/blog/2026-05-17-niri-tearing/niri-tearing.png
gallery:
     - url : /assets/images/blog/2026-05-17-niri-tearing/niri-tearing.png
       image_path: /assets/images/blog/2026-05-17-niri-tearing/niri-tearing.png
---
Sudah hampir 6 bulan aku memakai Niri sebagai compositor ku di Linux, aku memilih Niri karena dynamic workspacenya cocok dengan cara ku bekerja yaitu tidak mau mengatur windows. 

Ketika pertama kali mencoba Niri aku tidak tahu kalau Niri belum mendukung [screen tearing](https://techreviewadvisor.com/screen-tearing-explained/), Screen tearing ini berguna untuk monitor hertz rendah karena FPS nya tidak dibatasi oleh vsync sehingga input latency nya menjadi rendah cocok untuk game FPS. 

Saat ini maintainernya sedang menunggu [update dari upstream depedency](https://github.com/niri-wm/niri/issues/844) yang menambah dukungan screen tearing dan pas aku cek repo dari depedency tersebut belum di merge update untuk screen tearing sehingga untuk saat ini aku menggunakan Fork Niri milik [urayde](https://github.com/urayde/niri).

Setelah aku mencoba menggunakannya untuk bermain game Left 4 Dead 2 input latency yang aku dapatkan lebih rendah dari pada KDE Plasma serta FPS yang aku dapatkan juga konsisten, dengan ini aku tidak perlu berpindah ke KDE Plasma untuk bermain game dan bisa menunggu mainline dari Niri melakukan update untuk screen tearing.

{% include gallery %}
