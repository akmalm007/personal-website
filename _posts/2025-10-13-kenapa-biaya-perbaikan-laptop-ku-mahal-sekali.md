---
date: 2025-10-21
title: "Kenapa biaya perbaikan laptop ku mahal sekali"
category: blog
tags: linux devops homelab 
# stage:
# - [x] Pre-Writing
# - [x] Drafting
# - [x] Revising
# - [x] Editing
# - [ ] Publishing
---
Aku memiliki laptop Acer E1-410 dengan Intel Celeron dan RAM 2GB laptop ini menemani kuliah selama 2 semester dan telah mengalami berbagai kerusakan dari ketimpa air hujan, layar LCD yang redup, baterai yang sudah tidak berfungsi, dan sempat mati suri namun menolak untuk menghembuskan nafas terakhir karena kegigihannya untuk tetap dipakai akan kujadikan sebagai homelab dan testing environment untuk karir DevOps. 

# Mencoba Linux
Laptop ini awal mulanya memakai Windows 7, waktu itu mendapatkan rezeki dan menggantinya penyimpanannya ke SSD dengan metode cloning, SSD yang kubeli adalah Kingston 128Gb. Ketika proses cloning selesai aku langsung pasang dan setelah boot Windows 7 yang kupasang wallpapernya berubah menjadi hitam dan muncul *watermark* bahwa Windows mu itu illegal. Laptop lama ini sudah mencoba Windows 10 dan lambat ketika dipakai lalu Linux masih belum ada di radar ku jadinya aku dormankan Laptop lamaku.

Lalu muncul lagi kesempatan memakai laptop lama ketika mengikuti bootcamp DevOps salah satu tugasnya instalasi Docker dan Jenkins untuk menyimulasikan CI/CD Pipeline di sebuah aplikasi. Awalnya aku memakai laptop yang kupakai ketik sekarang untuk tugas itu dan pengalaman memakai Docker di Windows itu menyakitkan. Untungnya tugas ini bisa kuselesaikan tepat waktu tapi aku tahu bahwa berikutnya akan lebih berat lagi dan memakai Windows jelas bukan pilihan, lalu aku sadar bahwa Docker berjalan secara native dengan Linux dan ada laptop lama yang bisa kupakai dan dari situ perjalanan ku dengan Linux dimulai.

Linux yang pertama kuinstall di laptop lama adalah Ubuntu Mate, karena semasa SMK aku banyak menghabiskan waktu instalasi server dengan Debian dan Ubuntu. Linux membawa *[kehidupan baru](https://endof10.org/#:~:text=If%20you%20bought%20your%20computer%20after%202010%2C%20there%27s%20most%20likely%20no%20reason%20to%20throw%20it%20out.%20By%20just%20installing%20an%20up%2Dto%2Ddate%20Linux%20operating%20system%20you%20can%20keep%20using%20it%20for%20years%20to%20come.)* ke dalam laptop lama dan aku bener bener menikmati waktu ku menggunakan Linux terutama menggunakan terminal dan mulai suka bekerja di dalam terminal karena bisa melakukan apa saja.

Bootcamp DevOps yang kuikuti masuk ke fase akhir dan dibarengi dengan kuliah magang, waktu itu laptop yang kupakai ketik ini rusak baterainya dan aku belum bisa perbaiki jadi aku pakai laptop lama untuk menulis laporan dan kuliah selama masa magang. Aku diberikan laptop untuk bekerja oleh co-worker ku, laptop yang dipinjam adalah Lenovo Ideapad Gaming dengan AMD Ryzen 5 diperkuat dengan GPU GTX 1650, pertama kalinya dalam hidupku aku diberikan komputer yang *powerful* karena selama ini yang kupakai adalah komputer kentang. Pastinya tidak ku biarkan kesempatan ini sia sia selain mengerjakan tugas kantor, aku juga pakai buat instal Virtual Box dan mencoba berbagai macam Linux *flavor* dari Linux Mint, EndevourOS, dan Arch Linux. 

## Merasakan Arch Linux
Linux Mint adalah turunan dari Ubuntu jadi tidak banyak yang berbeda selain *dekstop environment*-nya - kala itu aku mencoba instalasi aplikasi Android di dalam virtualization. Aku berhasil menjalankan LineAge OS dan sempet ingin mencoba instalasi Game sebelum ditegur oleh IT di sana karena aku memakai bandwith yang banyak selama proses pemakaian.

Setelah puas dengan Debian Family aku beranjak kepada Arch Linux, dan aku langsung jatuh cinta pada instalasi pertama. Di dalam Wiki Arch terdapat script `archinstall` yang bisa dipakai untuk mempercepat instalasi atau bisa mencobanya manual - aku telah mencoba keduanya. Ketika proses instalasi manual banyak hal yang harus kuperhatikan seperti partisi, network driver, format file sistem, macam macam kernel dan *base package*, membuat use dan permissionnya, boot loader dan boot manager, lalu proses mounting pada partisi - aku sempat terjebak di konfigurasi GRUB dan ketika berhasil boot ke display manager aku senang sekali. Aku tidak mencoba melakukan enkripsi karena aku belum tahu prosesnya, hal yang membuat ku suka dengan Arch adalah desainnya modular lalu prinsipnya adalah D.I.Y jadi bisa dikustomisasi sebabas mungkin dan Arch tidak memegang tanganmu sistem rusak maka harus tahu cara memperbaikinya dengan R.T.F.M (Read the Friendly Manual).

Kustomisasi yang aku lakukan tidak banyak karena aku juga ingin menyelesaikan tugas dari Bootcamp DevOps jadi fokus ku waktu itu instalasi Docker, Minikube, dan Istio, dan di masa masa ini aku menemukan tools yang akan sering kupakai kedepannya seperti [Neovim]({% post_url 2025-08-18-After-1.5-years-i-finally-reconfigure-my-neovimrc %}), [Shell]({% post_url 2025-09-02-Kembali-ke-Terminal %}) (e.g BASH, Zsh), dan Tmux. Hingga sekarang aku masih memakainya dan beharap bisa mastering alat alat ini. 

Aku akui kegiatan yang kulakukan berlawanan dengan tugas kantor dan beberapa kali aku ditegur karena perbuatanku, setelah refleksi seharusnya aku pisahkan urusan kantor dengan pribadi. Tapi aku bersyukur dengan kesempatan diberi laptop yang bagus dan memakainya karena itu aku berterima kasih sekali lagi atas kesempatannya.

# Kembali ke laptop lama
Setelah Masa bakti di PLN selesai aku putuskan di tahun 2024 untuk mengganti Ubuntu Mate dengan Arch Linux, ketika proses instalasi saat membuat partisi kupikir untuk menulis ulang table yang telah dibuat oleh Ubuntu Mate dengan konfigurasi yang sudah kubuat hasilnya adalah table tersebut tidak terhapus dan SSDnya rusak kemungkinan karena corrupt dari formatting file sistem yag salah. Aku coba beberapa kali namun SSDnya tidak terformat dengan benar, bahkan beberapa kali aku cek di laptop ini bagaimana healthnya dan sekilas masih bisa dipakai. Akhirnya aku coba troubleshooting dengan metode ini:
- Menjalankan command untuk cek health dari partisi dan mencoba menyelamatkan block device yang belum corrupt - aku lupa commandnya apa.
- Mencolok power SATA SSD ke kabel charger yang katanya bisa mengaktifkan S.M.A.R.T sistem untuk lakukan regulasi dan membersihkan cache yang rusak.
Setelah 6 jam hasilnya SSD itu tidak bisa dipakai dan aku menyerah lalu memutuskan untuk beli.Selama masa tunggu ini aku mulai mengingat kembali kerusakan yang pernah dialami sampai sekarang dan bagian berikutnya akan menjelaskan.

## Biaya Upgrade dan Perbaikan
Bagian ini adalah daftar secara kronologis berbagai *upgrade* dan perbaikan untuk memakai laptop lama untuk bisa berfungsi:
- Layar Redup, seingetku kerusakannya karena LCD yang mau mati - ketika dihidupkan masih nyala namun kecerahannya rendah, pernah beberapa kali menyala secara terang sebelum redup lagi. Biaya yang dikeluarkan untuk mengganti LCD sebesar **Rp700.000**.
- SSD 128 GB dan External Case, mungkin masuk kategori upgrade tapi produk yang kubeli ternyata jelek dan external case sebagi bonus pembelian, total aku beli **Rp245.000**.
- RAM 4GB, alasan upgrade RAM karena ketika memulai K8S laptop berjalan lambat dan 2GB kurang untuk menjalankan node di K8S jadi aku upgrade ke 4GB. Beli RAM **Rp64.000**. 

  Sayangnya ketika pemasangan aku memaksa satu baut untuk membuka bagian untuk mengganti RAM sampai tidak bisa lagi diputar, dan parahnya ketika bapakku coba putar dia menggunakan minyak jelatah dan akhirnya laptop tidak bisa menyala lagi. Syukurnya listrik masih mengalir berarti MBnya masih hidup. Untuk memperbaiki itu butuh sekitar **Rp300.000** jadi total buat *upgrade RAM* adalah **Rp360.000**.
- SSD 256GB, setelah SSD Kingston wafat aku harus menabung untuk membeli SSD. Orang-orang merekomendasikan 256Gb dibanding 128Gb untuk *future proof* jadi nya aku ikuti dan membeli SSD Hiksemi Wave seharga **Rp200.000**. Sebelum aku beli ada pilihan lain yaitu T-Force Vulcan tapi lebih mahal 50k lalu Hiksemi aku lihat track recordnya bagus dan ada spek tertulis tentang SSDnya.
- Charger laptop, Charger laptop lama ku yang original sudah digigit tikus kabelnya jadi harus ganti dan beli seharga **Rp50.000**, sampai Juni 2025 ini ketika Adek ku pakai kerja di kantornya Charger yang dipakai meledak dan untungnya tidak dicolok ke Laptop. Aku tidak mau membuat resiko dengan mencoba colok charger itu ke laptop untuk test masih hidup makanya aku menabung lagi untuk beli Charger, ada rezeki setelah wisuda uangnya dipakai buat beli charger seharga **Rp100.000** yang sesuai dengan adapter dan colokan yang terpisah. 

Total ku habiskan untuk perbaikan laptop lama sekitar **Rp1.700.000**, biaya sebesar itu bisa untuk modal untuk beli [mini](https://tk.tokopedia.com/ZSUCpNggV/) [pc](https://tk.tokopedia.com/ZSUCpsvF9/) dan speknya bahkan lebih bagus dibanding laptop lama. Tapi aku tidak menyesal memakai uang ku dan menunggu selama ini untuk memakai latop tersebut karena ku ingin *preserve* alat yang kupunya dan itu lebih baik dibanding membeli baru.

# PostMortem
Segmen ini sebagai pengingat buat diriku di masa depan solusi dan pembelajaran yang kudapat dari perbaikan laptop lama. 
- Layar, ada dua *use case* jika ingin memakai laptop lama.
	1. Solusi Pertama : Dibutuhkan untuk administrasi dan browsing internet maka bisa menggunakan monitor kedua atau layar TV yang disambung lewat kabel HDMI untuk menampilkan layar.
	2. Solusi Kedua adalah *headless* yang berarti tidak ada alat yang terhubung seperti mouse dan keyboard ke komputer, untuk memakainya menggunakan SSH (Secure Shell) untuk Linux maupun RDP untuk Windows. Metode ini harus memastikan sudah membuat public key untuk bisa koneksi dan membuat hostname yang mudah diingat untuk terhubung dengan komputer.
- Storage, penyimpan tidak boleh ada kompromi dengan memakai merek SSD seperti Rx7 atau Midasforce. Merek SSD yang bagus dipasaran antara lain Hiksemi Wave dan T-Force Vulcan.

   GUI Installer seperti Ubuntu, Fedora, dan Cachy OS menggunakan tabel partisi dengan bootloader `/boot/efi` dan root directory `/` jika memilih pilihan bawaan, kalau mau membuat partisi lain bisa menambah directory home `/home` dan untuk dipisah dari root directory penjelasn lebih lengkap bisa disimak di [Arch Wiki](https://wiki.archlinux.org/title/Partitioning#/home).

- RAM, obeng yang dipakai harus cocok untuk baut yang terpasang ketika membuka laptop dan lakukan dengan hati hati karena komponen laptop itu rapuh.
  Kebutuhan sistem untuk Linux itu kecil jadi 4GB sudah cukup dan jika ingin future proof maka 8GB masih bisa dijalankan oleh motherboard laptop lama. 
- Charger, gunakan yang original bawaan dari laptop, ketika membeli *aftermarket* pastikan adapter dan colokan terpisah, pada kasusku charger pertama yang terbeli kepala charger dan adapter menjadi satu dan ketika kunci kepala colokannya sudah rusak maka sulit untuk dipakai.
- OS, Linux memberikan banyak pilihan, untuk itu aku akan berikan kurasi untuk setiap penggunaan:
	- [Debian](https://www.debian.org/index.en.html), [Linux Mint](https://www.linuxmint.com/), dan [Zorin OS](https://zorin.com/os/) : Linux ini cocok bagi yang ingin mencoba Linux pertama kali dengan *live installation* yang bisa dipakai untuk eksplorasi terlebih dahulu. Kelebihan lain adalah OS ini melakukan major update setiap 2 tahun sekali, berbeda dengan Windows Home yang selalu mengeluarkan update tiap bulannya, OS Linux ini memastikan penggunannya siap ketika ada update datang bukan dengan memaksa update ke tenggorokan pengguna seperti Microsoft.
	- [Arch](https://wiki.archlinux.org/title/Main_page), [OpenSUSE](https://www.opensuse.org/) : Linux ini cocok untuk pengguna dengan hardware terbaru karena sistem *[rolling-release](https://en.wikipedia.org/wiki/Rolling_release) atau yang ingin mencoba berbagai komponen yang ada di Linux mulai dari [desktop environment](https://wiki.archlinux.org/title/Desktop_environment), [file sistem](https://wiki.archlinux.org/title/File_systems), [terminal emulator](https://wiki.archlinux.org/title/List_of_applications/Utilities#Terminal_emulators) dan masih banyak lagi yang bisa dicoba lalu [prinsip dari Arch](https://wiki.archlinux.org/title/Arch_Linux#:~:text=Arch%20Linux%20has%20always%20been%2C%20and%20shall%20always%20remain%20user%2Dcentric) sesuai dengan diriku yaitu kebebasan untuk memilih.
	  Namun hati hati saat kustomisasi karena akan ada rabbit hole yang bernama *ricing* Linux dimana pengguna berlomba lomba menampilkan *setup* yang tercantik, saranku gunakan KDE dan pakai Konsole untuk terminal itu sudah cukup.
	- [Void Linux](https://voidlinux.org/), [Gentoo](https://www.gentoo.org/), [NixOS](https://nixos.org/): Linux versi ini jarang disebut pada khalayak umum dan biasanya untuk pengguna yang mahir dan sudah tahu sistem apa yang diinginkan, sejauh ini aku baru mencoba NixOS package karena bisa diinstall di dalam Linux lain bahkan aku pernah mencobanya di CentOS ketika memakai Cloud Hosting karena ingin mendapatkan versi terbaru dari Neovim.
	- [Linux from scratch](https://www.linuxfromscratch.org/): Kalau mampu maka coba membuat Linux sendiri (aku juga ingin coba) maka sudah ada handbooknya yang akan menjelaskan cara buatnya. 
Apapun OS yang nanti dipilih pastikan nyaman memakainya dan tahu apa yang ingin didapat dari OS yang dipakai. Kemudian jika ingin *walkthrough* lebih lengkap tentang OS yang lain bisa cek video milik [LinuxNext](https://www.youtube.com/watch?v=09HdyVjVaF8) yang menjelaskan OS, Download, dan Instalasinya. 

# Hal berikutnya
Konsep Homelab di tahun 2023 belum pernah dengar dan baru tahu di 2024 ketika ingin memperdalam cara belajar dan karir menjadi DevOps lalu aku melihat youtube channel [Mischa van de Burg](https://mischavandenburg.com/) dia menjelaskan ketika memulai karir DevOpsnya dia mulai dengan homelab. Dari situ dia mulai eksprimen dengan berbagai macam deployment dari container sampai kubernetes dan karena itu lah yang jadi motivasku tetap mempertahankan [jalan karir]({% post_url 2025-10-11-i-was-right-all-along %}) ku karena tidak ingin berubah rubah.

