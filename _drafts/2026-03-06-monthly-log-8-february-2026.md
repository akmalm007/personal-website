---
date: 2026-05-10 00:02:57 +0700
category: log
tags: life work 
---
# Why this Late?
Aku tidak kasih diriku buat tulis blog karena sehabis pulang dari tempat magang aku langsung GYM pas waktu malamnya lalu ketika weekend tiba aku terkadang juga sibuk dengan kegiatan yang lain, ini juga salah ku sendiri karena tidak kasih struktur dan sistem yang konsisten dalam menjalankan kegiatan ku.

Aku kedepannya akan hilangkan media diet sesuatu yang aku tiru dari [Roy](https://roytang.net) dan [Joel](https://joelchrono.xyz) tapi aku sadar aku bukan orang yang suka konsumsi media seperti manga, novel, maupun movie dalam reguler basis namun aku lebih senang dengan latihan baik itu Aim Training, GYM dan saat ini membangun [Homelab dan Self Hosting]({% post_url 2026-04-09-pain-and-suffering-with-podman %}).

Aku akan post monthly log pada bulan bulan yang lalu dan hanya berfokus pada jurnal yang telah kutulis.

# Pada bulan ini
Januari kemarin aku merasa di puncak terbaru maka Februari cara ku untuk membuat fondasi dari sistem yang sudah ada agar tidak hancur nantinya. Walaupun ku akui jadwal dan flow ku bekerja selalu berubah setiap 1 atau 2 bulan seperti Januari kemarin aku menambah GYM di jadwal ku sehingga waktu belajar dan blogging menjadi berkurang. Aku akan coba luangkan waktu ketika weekend maupun ketika tidak ada bekerja untuk blogging.

# Minggu-1
- Pada minggu ini aku mencoba Alpine Linux karena menggunakan CachyOS pada Laptop tidak praktis, aku terinspirasi dari video milik [tony](https://youtu.be/NKggFBdee94?si=V74oHX91nwwVCKHF) dan mencoba instalasi Alpine Linux. Proses instalasinya lebih mudah dibandingkan Windows 11 dan hanya menggunakan 200mb ketika sudah selesai intalasi.
- Selesai instalasi aku menghabiskan banyak waktu untuk instalasi WM Niri dan ternyata aku perlu instalasi GDM atau Display Manager milik GNOME untuk bisa menggunakan Niri. Selain Niri aku coba install juga OXWM namun tidak berhasil. 
- Setelah puas otak atik Alpine dengan WM selanjutnya aku install Nginx dan Docker untuk mempersiapkan laptop lama untuk bisa dipakai menjadi Git Server, CI CD Runner, dan Registry. Prosesnya sendiri seru dan aku akan buat blog sendiri untuk itu bagaimana aku setupnya.
- Di kantor sendiri pekerjaan berikutnya adalah membuat load balancing untuk environemnt staging, prosesnya sendiri membuat dua container lalu di dalam config Nginx akan ada block upstream yang tangkap kedua container tersebut untuk diarahkan ke block server. Ternyata jauh lebih mudah dibandingkan yang kukira hanya saja aplikasi masih belum mampu buat handle itu dan yang terjadi adalah ketika testing adalah ketika user mengirim request akan terjadi race condition yang mana request dari user mana yang akan sampai duluan dan hasil yang terjadi adalah ada dua request yang masuk karena dua container mengirim reqeust yang sama ke database.
- Lalu aku coba optimasi ukuran image yang ukurannya besar dengan menggunakan Alpine *spoiler alert* doesn't end well. Di bulan ini juga aku mulai belajar implementasi multi stage di Dockerfile.
- Terakhir di minggu aku mencoba opencode yaitu coding assistant tools di terminal karena saran dari teman magang karena sulitnya membuat konteks ke chatbot biasa di web jika tidak tahu di directory isinya apa saja, aku akan tetap anggap ini sebagai chatbot dan tidak akan chatbot mengerjakan tugas ku [karena tidak akan kubiarkan chatbot memakan makananku](https://pluralistic.net/2026/01/07/delicious-pizza/).

# Minggu-2
- Aku awali minggu ini dengan menonton [Super Bowl 60](https://youtu.be/ksG9O8PHXbI?si=2aMCjhC-4OQwRP7N) dan melihat Seahawk menghancurkan Patriot, sayangnya tidak terjadi blow out yang diharapkan namun setiap usaha yang dilakukan oleh offense dari Patriot berhasil diredam oleh Dark Side milik Seahwak. Offense mereka sendiri baru berhasil touch down saat Q4 dan match ini dimulai sekitar jam 07.30 WIB saat aku sedang commute ke Kantor. Dan setelah sampai aku tetap lanjut menonton sampai akhir match.
- Deployment sempat terjadi error pada aplikasi frontend yaitu aplikasi yang dijalankan berat untuk server sehingga terjadi overload ini terjadi karena Server Side Rendering dibebankan **SEMUANYA** pada server sehingga server melambat sampai harus restart ulang kembali dan menghapus session sebelumnya. 


    Mitigasi yang pertama dilakukan adalan mematikan aplikasi frontend untuk sementara dan dikemudian harinnya aku putuskan untuk menambah limit resource pada aplikasi frontend dengan property dari `deploy` seperti dibawah:

    ```docker
          deploy:
            resources:
              limits:
                cpus: '0.75'
                memory: 2000M
    ```

- Selain itu aku juga melakukan optimisasi pada image backend dengan menggunakan multi stage building, aku menggunakan contoh dari dokumentasi dari docker dengan laravel project examples. Stage pertama adalah instalasi library, package, serta extension yang diperlukan PHP untuk menjalankan aplikasi beserta kodenya. Tahap berikutnya runner pada tahap ini image dimulai lagi dari awal dan perlu instalasi library kembali namun cukup library yang berfungsi untuk menjalankan aplikasi selebihnya bisa copy dari stage builder.

    Walaupun begitu masih terjadi error yang mana aplikasi terkadang belum mendapatkan update terbaru ketika deployment terutama di tahap staging sehingga teman ku yang develop bingung bagaimana melakukan test aplikasi, masalah ini coba ku pecahkan di minggu berikutnya.

- Kemudian selama minggu ini aku coba setup CI CD Pipeline di laptop lama serta laptop ini jadi laptop lama akan dijadikan runner Pipeline lalu laptop ini menjadi Git server untuk mencoba apakah CI CD yang ingin kuterapkan berhasil atau tidak.

- Terakhir aku tutup minggu ini dengan bertemu dengan teman main di preksu Depok, terakhir kami bertemu sekitar 1 tahun yang lalu di KFC. Karena bosan dengan ayam cepat saji maka kami berpindah menjadi ayam geprek.

# Minggu-3
- Pada hari minggu ada kerja bakti dan workout labor itu berbeda dengan mengangkat beban, karena labor itu memperlukan tenaga seperlunya lalu stamina yang kuat agar bisa bekerja dalam kurun waktu satu sampai dua jam. Stamina ini yang akan kuperlukan nanti ketika [Idul Adha]({% post_url 2025-10-23-statistik-pemotongan-hewan-kurban-idul-adha-1446H %}).
- Minggu ini juga aku mulai mencoba CI CD pada instalasi Gitea di local laptop ku untuk mempermudah nanti dalam deployment aplikasi, rencananya adalah laptop ku menjadi server git serta runnernya lalu nanti teman kerja ku akan push ke laptop ini pada network kantor dan proses akan dijalankan oleh pipeline yang sudah disiapkan. Sayangnya workflows ini tidak bekerja mulus karena teman ku sudah nyaman dengan push di Gitlab dan membuat dia push ke dalam personal Gitea ku juga terlihat tidak baik karena aku bisa aja sisipin modifkasi tertentu. Ini bukan berarti aku akan berbuat jahat namun harusnya ada implementasi yang lebih baik.
- Terakhir aku juga melakukan [reset pada ssd dan router]({% post_url 2026-02-15-reset-router-dan-ssd %}) karena ini kupakai untuk hal lain seperti memasang kabel LAN serta memanfaatkan storage yang tidak terpakai nantinya.
- Minggu ini fokus ku selama Magang adalah mencoba integrasikan CI CD Workflows dengan VPS nantinya sehingga aku bisa deploy aplikasi dengan cepat dan tanpa perlu `ssh` ke server karena itu menyebalkan.

# Minggu-4

