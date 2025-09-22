---
title: "Personal Website"
excerpt: "Dokumentasi, Keputusan Teknikal, dan Post Morterm dalam pengerjaan proyek Personal Website"
header:
    image: ../assets/images/portfolio/personal-website-unplash.jpg
    teaser: ../assets/images/portfolio/personal-website-unplash.jpg
---
Halaman ini berisi dokumentasi tentang background, teknikal desain, dan post morterm dalam pembuatan personal website ini, dokumentasi ditunjukan sebagai referensi untuk pembaca yang ingin tahu cara membuat personal website dan melihat berbagai pilihan yang bisa dipakai nantinya ketika membuat.

# Background
Ide untuk membuat personal website sudah ada dari dulu, rencananya menggunakan Laravel dengan Virtual Private Server (VPS) sebagai hostingnya dengan setup ini skalabilitas dan fungsi seperti comment dan user log in dapat diimplementasikan hanya saja **mahal** dari biaya bulanan VPS lalu mempelejari Teknologi OOP dan Laravel. Karena itu aku urungkan niat untuk membuat personal website.

## Portfolio or Blogging Website
Selama riset banyak teman teman yang kulihat menggunakan portfolio website, mereka menampilkan Background, Project, Testimoni, List Skill, Resume/CV, dan Kontak. Sekilas mudah untuk dibuat namun terkadang ketika dikunjungi menampilkan animasi yang berlebihan, menurutku itu menjengkelkan dan tidak perlu karena pengujung ingat lihat isinya bukan animasi yang cantik.

Pilihan kedua adalah blogging website, blogging website bebas dalam menampilkan konten dan memilih tema tertentu seperti teknologi, memasak, dan olahraga dengan ini blogging terasa personal karena memiliki kebebasan dalam publikasi konten. Kekurangannya adalah blogging website konten didalamnya bersifat dinamis maka pengunjung tahu mana website blogging yang masih aktif dan yang sudah ditinggalkan [^blog-portfolio-website]. 

Dari portfolio dan blogging website aku memilih blogging karena kebebasan dalam mengatur konten didalamnya serta lebih personal dibandingkan portfolio, alasan kedua portfolio itu *[cherrypicking](https://www.merriam-webster.com/dictionary/cherry-pick)* konten yang ada didalamnya dipilih dari prestasi, pekerjaan, skills, serta project untuk ditampilkan sedangkan bloggin seseorang bebas menulis dan publikasikan karyanya dan pengunjung bebas memilih tulisan apa yang menarik untuk dibaca[^memex-method]. 

Terakhir adalah domain name, menurutku ada nilai unik untuk memiliki domain name pribadi karena ketika domain name sudah diambil orang lain tidak bisa mengambilnya lalu dalam platform media sosial akan aneh untuk memanggil atau memperkenalkan diri kepada seseorang dengan username di medial sosial dengan itu aku memiliki pendapat bahwa semua orang bisa punya akun di media sosial tapi tidak semua memiliki domain name yang bisa dicari di internet[^internet]. 

[^blog-portfolio-website]: Referensei di ambil dari [GeeksforGeeks](https://www.geeksforgeeks.org/websites-apps/blog-vs-portfolio-choosing-the-right-website-format-for-you/)

[^memex-method]: Tujuan ku blogging akhirnya terungkap bukan untuk 'Personal Branding" tapi sebagai tempat untuk mengetahui tulisnku akan membawa ku kemana sekalipun belum ada ide untuk menulis buku, artikel[blog ini](https://pluralistic.net/2021/05/09/the-memex-method/#:~:text=BE%20THE%20FIRST%20PERSON%20TO%20NOT%20DO%20WHAT%20NO%20PERSON%20HAS%20NOT%20DONE%C2%A0BEFORE)

[^internet]: Paragraf terakhir adalah pendapat pribadi yang mencintai kebebasan tanpa belenggu dari platform manapun. Bisa cek pendapat pribadi ku di [blog sebelumnya]({% post_url 2025-08-25-Today-i-start-blogging %}).

# Teknikal Desain
Dalam membuat blogging website ada dua pendekatan dinamis dengan Content Management System (CMS) seperti Wordpress atau Blogger dan Framework MVC seperti Laravel atau Django lalu alternatif lain adalah menggunakan Static Site Generator (SSG). Static Site Generator bekerja dengan membuat konten tulisan seperti blogpost, artikel dan dokumentasi yang telah distruktur dengan HTML atau Markdown lalu diolah untuk bisa dibaca oleh browser[^ssg] .

Dalam kasusku personal website tidak perlu menyimpan data di dalam basis data, kemudian tidak ada logika bisnis yang perlu dilakukan di dalam server, dan terakhir setiap halaman yang dibuat berbentuk markdown atau HTML yang bisa dipakai dimana mana. dengan itu SSG cocok untuk penggunaan ku dalam membuat personal website karena tidak ada biaya untuk mengolah server lalu mudah membuat antarmuka dan desain dengan template dan tema yang tersedia.

Static Site Generator yang kugunakan adalah Jekyll[^jekyll], Jekyll memiliki fitur templating untuk membuat halaman, memiliki banyak pluggin, dan didalamnya sudah ada fitur untuk blogging sepeti categories, tags, permalink sehingga akan mudah untuk mencari dan arsipkan tulisan lalu proses *deployment* mudah dengan menggunakan Github-Pages dan Netlify ketika website sudah siap untuk dipublikasikan.

## Struktur Halaman
Dengan Static Site Generator membuat halaman dan navigasi mudah untuk dilakukan, dengan itu aku perlu membuat struktur dan menentukan fungsi setiap halaman di dalam personal website.

* Home: Halaman home akan ada perkenalan tentang website untuk apa dan siapa yang membuatnya, dalam kasusku aku menjelaskan bahwa aku adalah **penulis** karena semua tulisan yang ada di dalam adalah buatanku dan **maintainer** yaitu seseorang yang menjaga dan mempelihara website karena personal website ini sebagai tempat ku berkreasi maka aku punya tanggung jawab untuk selalu update dan menambah konten didalamnnya.

* Index: Halaman Index memiliki banyak penamaan lain seperti Article, Blogs, Posts, Essay dan Archive semua memiliki arti yang sama yaitu daftar dari konten yang ada didalam website biasanya adalah tulisan atau galeri, aku memebdakan post ku menjadi tiga kategori yaitu Blog, Artikel, dan Log. Masing Masing memiliki fungsi yaitu:

    * Blog 
    :   sebagai tulisan tentang pengalaman ku dalam sehari hari ataupun topik yang ingin ku angkat, biasanya bersifat pesonel dan banyak opini pribadinya

    * Artikel
    :   Tulisan yang panjang, luas, dan mendalam untuk membahas sebuah topik didalamanya terkadang ada fitur *Table of Content* untuk memudahkan pengunjung untuk navigasi tulisan.

    * Log
    :   Log dalam ilmu komputer adalah proses yang tercatat di dalam sistem, Log untukku sebagai tempat buat menulis kegiatan yang sudah aku lakukan dan melihat kembali apa yang sudah kukerjakan seperti memoar[^memoar].

* Portfolio: Halaman ini menampilkan project yang telah dikerjakan sebelumnya dan pendekatan ku untuk portoflio adalah Dokumentasi. Seperti di awal paragraf pekerjaan tidak bisa bebicara dan hanya menampilkan tujuan dan fungsi utama aku rasa belum cukup jadi menurutku lebih bagus dengan membuatnya sebagai dokumentasi sehingga orang yang membacanya tahu kenapa project ini berharga bagi pembuatnya. 

* About: Halaman ini menjelaskan siapa diri kita, ada banyak cara yang bisa dilakukan seperti menjelaskan pekerjaan yang dilakukan sekarang, motivasi dalam melakukan pekerjaan, ataupun sekedar menjelaskan website yang dibuat berfungsi untuk apa.
Dalam kasusku aku menambahkan CV, siapa diriku, kontak, website ini untuk apa dan media sosial yang bisa diikuti.

## Tema
Tema dalam Static Site Generator beragam dari membuat sendiri dari awal ataupun memakai tema yang sudah dibuat oleh komunitas, pendekatan ku adalah menggunakan tema yang sudah ada karena lebih cepat dan praktis lalu tujuan utama ku membuat personal website sebagai tempat untuk menaruh tulisan bukan untuk tempat berkreasi atau mencoba berbagai fungsi.

Jekyll memberikan banyak opsi dalam menggunakan tema ada yang lewat Ruby Gems yaitu Package Manager milik Ruby atau download langsung dari repository dan menaruhnya di dalam project file lalu dijalankan dan lihat hasilnya, untuk mencari tema yang sesuai bisa lewat [Rubygems](https://rubygems.org/) dan memasukkan query `jekyll-themes` atau lewat [Jekyll Resources](https://github.com/topics/jekyll-theme) dan melihat berbagai tema yang ada di Github.

Aku menggunakan [Minimal-Mistake](https://github.com/mmistakes/minimal-mistakes) karena fiturnya lengkap dan sesuai dengan ekspetasi dalam membuat halaman blog lalu salah satu contributornya memiliki website bernama [Made Mistake](https://mademistakes.com/) dan dari websitenya itu lah aku terinsprasi untuk mengikuti gaya yang dibuat dan untungnya dia sudah membuat tema yang mirip dengan website dia sebelumnya.

## Pembuatan
Bagian ini aku akan menjelaskan secara singkat bagaimana aku membuat personal website dari halaman, setting, dan publish di internet, tahapannya tidak akan mendetail karena sudah ada dokumentasi dan guide yang ditulis di website Jekyll namun aku akan coba *highlight* poin point penting ketika ingin membuat website dengan Static Site Generator.

* **Persyaratan:**
    * Memiliki komputer pribadi seperti Laptop atau Komputer Dekstop
    * Akses Internet
    * Pengetahuan version control system seperti Git[^git]
    * Kode Editor (Vscode, Notepad++, Atom, Sublime Text, Neovim)

* **Instalasi Jekyll:** Tahapan instalasi aku menggunakan Ubuntu WSL2 di Windows 10 22h2 versi 19045.6093 (karena ada beberapa perangkat Windows yang tidak bisa install WSL2) dengan package manager apt untuk menginstall Ruby. Lihat dokumentasi Jekyll dan Ruby untuk sistem operasi yang dipakai untuk instalasi. Dari yang kubaca Ruby di Windows rumit untuk digunakan karenanya aku pakai WSL2 untuk lingkungan pengembangan ku namun dokumentasi Jekyll sudah menyediakan opsi jika ingin memakai Windows untuk pengembangan [^jekyll-on-windows].

* Instalasi Tema: Tema yang ada di [Rubygems](https://rubygems.org/) bisa diinstall dengan dua cara pertama menggunakan Gems seperti `gem install minima` maka tema tersebut akan terpasang secara global di dalam sistem, cara kedua adalah menggunakan bundler[^bundler] di dalam direktori website. Bundler bekerja seperti penjaga perpustakaan dia menjaga buku atau dalam kasus ini *dependecies* tetap sama ketika masa pengembangan dan berada di publik, lalu daftar dari buku yang ada di perpustakaan tersimpan dalam file bernama Gemfile, Gemfile berfungsi untuk menyimpan daftar *dependecies* yang diperlukan oleh website jika ingin update atau menjaga versi tertentu dari *dependecies* yang dipakai maka BUndler akan melihat Gemfile sebelum melakukan perubahan[^dependecies].

* Membuat Halaman: Setelah Jekyll dan Tema selesai dipasang maka untuk membuat halaman dimulai dengan membuat `index.html` di dalam root direktori dari proyek, karena `index.html` ini akan dipasang dalam direktori `_site` yang menjadi tempat website akan dipublikasikan. Kemudian bisa mulai mengatur halaman lain seperti Home, Archives, dan About Me. Hal terpenting ketika membuat halaman adalah memperhatikan layout yang sudah diberikan oleh tema tersebut biasanya mereka menamakan layout mereka seperti home, archive, dan single[^mm-layout] untuk digunakan sesuai dengan kebutuhan dan layout bisa menggunakan format HTML atau Markdown dalam membuatnya. Dalam kasusku halaman Home menggunakan `layout:home`, halaman Posts `layout: posts`, halaman Portfolio `layout: collection` dan terakhir About menggunakan `layout: single`. 

* Front Matter: Front Matter adalah metadata yang digunakan oleh Static Site Generator untuk generasi konten yang ditulis untuk membantu menentukan hal hal seperti judul, tanggal, kategori dan tags. Opsi dari Front Matter antara lain:

    * layout
    * permalink
    * title
    * date
    * tags
    * categories

    Tanpa Front Matter halaman tidak akan dibuat oleh SSG dan hasilnya akan kosong tanpa adanya data data yang diperlukan untuk membuat halaman

## Deployment
Tahapan yang seru sekaligus menakutkan yaitu publikasikan website ke internet, dalam tahapan ini sering kali aku tersandung dengan depdencies error ketika push di produksi padahal di local environment bekerja. Berikutnya adalah pemilihan bagaimana aku publikasikan website ke dalam Internet.  

* **Hosting:**
Pilihan Hosting ku adalah Netlify karena di dalam Jekyll dokumentasi terdapat guide untuk deploy website dengan jekyll dan kedua adalah dukungan plugin, kalau aku deploy lewat Github Pages maka ada beberapa plugin yang tidak bisa dipakai dengan itu akan memakan waktu lagi untuk melihat plugin yang bisa dipakai atau tidak dengan Netlify aku bisa bebas memakai plugin apapun karena bersifat *serverless* jadi semua konfigurasi yang diperlukan untuk menyiapkan website sudah ditangani oleh Netlify ditambah proses sertifikasi SSL dilakukan otomatis dan menambah domain name juga tidak sulit.

* **Domain Name:** 
Membeli domain name bisa lewat [Hostinger](https://www.hostinger.com/id/domain-murah) atau [Rumahweb](https://www.rumahweb.com/domain-murah/), aku ambil domain name .my.id karena melihat domain name dari portfolio teman dan harganya murah seharga Nasi Padang yaitu Rp. 16.000. Aku pilih Hostinger untuk registrasi domain name dan kedepan ingin coba layanan mereka yang lain seperti Mailbox dan VPS. Ketika website berhasil deploy di Netlify maka perlu menambah IP Address yang didapat kedalam DNS Record milik Hostinger dengan A record menuju IP Address yang diberikan[^netlify].

* **DNS Provider:**
DNS Provider aku memakai Cloudflare karena mereka memiliki fitur AI Bot Crawler yaitu mencegah AI Bot untuk ambil data dari websitemu. Mengganti DNS Provider dari Hostinger ke Cloudflare prosesnya ternyata mudah dibanding yang kukira yaitu pertama menghapus nameserver yang diberikan oleh Hostinger lalu mengubahnya dengan milik Cloudflare setelah itu record yang ada di Hostinger akan berpindah ke Cloudflare dashboard dan disitu bisa menambah record lain jika diperlukan. 

* **Analytics:**
Provider analytics website ku adalah [Umami](https://umami.is/) karena telemetri dan insight yang ingin ku dapat adalah darimana pengunjung berasal dan link apa yang mereka klik, aku tidak memakai Google Analytics karena berbagai alasan seperti Privasi Pengunjung, Google belum mematuhi GPDR dan Google Analytics bisa memperlambat website.

[^netlify]: Intruksi lengkapnya ada di dokumentasi Netlify
[^mm-layout]: https://mmistakes.github.io/minimal-mistakes/docs/layouts/#default-layout 
[^dependecies]: Dependecies adalah kode yang berisi fungsi fungsi tertentu seperti math, gambar atau sebbagainya lalu dijadikan paket untuk dikirim kedalam repositori seperti Rubygems untuk developer atau pengguna lain memakainya.
[^bundler]: https://bundler.io/
[^jekyll-on-windows]: https://jekyllrb.com/docs/installation/windows/
[^git]: https://git-scm.com/
[^ssg]: https://developer.mozilla.org/en-US/docs/Glossary/SSG
[^jekyll]: https://jekyllrb.com/
[^memoar]: https://id.wikipedia.org/wiki/Memoar

# Postmortem
Dari membuat personal website termasuk pelajaran yang menarik dan menemukan banyak hal yang menarik tentang internet, lalu selama proses membuatnya aku hanya mengikuti tutorial yang diberikan oleh Jekyll dan langsung implementasi dengan tema karena aku belum memiliki kemampuan untuk membuat desain dengan Figma ataupun sampai tahap membuat UI Desain dengan CSS sehingga aku memakai tema yang dibuat komunitas. 

Lalu dari membuat personal website ku aku teknologi yang terasa asing padahal sudah ada lama yaitu RSS, website seperti berita atau blog update kontennya secara berkala dan pengunjung harus pengunjungi website mereka untuk membaca nya lalu jika banyak blogger dan website berita yang diikuti maka akan sulit nantinya harus berkunjung ke berbagai tempat. Dengan RSS pemilik website bisa standarisasi konten websitenya menjadi format yang sama yaitu Feeds, Feeds dipakai oleh **feed reader**, **news reader**, **feed agregatro** untuk mengambil update dari website lalu menampilkannya di dalam satu tempat jadi pengunjung website tidak perlu cek manual masing masing social media atau website jika ada update [^rss-geeks] [^wiki] . 

RSS Feed aku pikir akan bermanfaat bagi pendidkan karena selama aku kuliah update tentang kampus dilakukan di Instagram dan informasi penting dibagikan lewat Grup chat WA, itu tidak efektif karena terpisah pisah tempat untuk mencari informasi apalagi aku bukan pengguna aktif Instagram jadi aku sering kali tertinggal informasi. Dengan kampus menyediakan RSS Feed untuk sumber informasinya aku yakin bisa mempermudah para mahasiwa mengakses dan mencari informasi yang mereka perlukan tanpa perlu tenggelam di sosial media.

Berikutnya daftar peningkatan yang bisa kubuat nanti:

## Hosting Platform
Tempat ku hosting website terpisah pisah kalau diiingat kembali Hosting berada di Netlify, membeli domain name di Hostinger, dan DNS Provider dengan Cloudflare. Akan menjadi maintanance nightmare jika terjadi sesuatu lalu ketika ingin melakukan perubahan seperti mengganti domain name atau berpindah hosting website. 

Idealnya adalah menggunakan satu provider dan ketiga layanan di atas lucunya sudah memberikan hosting, DNS, dan domain name dalam satu tempat, untuk kedepannya aku ingin menggunakan VPS provider seperti Hostinger untuk hosting website ku nanti karena menggunakan layanan serverless seperti Netlify tidak memberikan kebebasan untuk otak atik lalu memiliki VPS pribadi bisa membuka kesempatan untuk mencoba aplikasi lain seperti analytics, coolify, docker, kubernetes, atau Hosting game server seperti Left 4 Dead 2 maupun Minecraft. Untuk DNS aku akan masih memilih Cloudflare karena fitur AI Bot Crawlernya tapi mungkin aku bisa pindahkan ke Hostinger agar ada di satu tempat.


## Bahasa
Personal website yang aku kunjungi biasanya menggunakan bahasa inggris untuk tulisan mereka ada juga yang memakai bahasa lokal tetapi itu jarang, sempat terpikir untuk berfokus untuk memakai bahasa inggris tapi aku pustuskan untuk tetap memakai bahasa Indonesia karena aku masih belum benar benar menggunakan bahasa ku ini dengan baik dan masih ada potensi untuk menggunakan ejaan yang baik dan benar untuk itu akan tetap memakainya sampai aku sudah nyaman dengan kegiatan menulis ku dan belajar lagi untuk menggunakan bahasa indonesia dengan EYD. Mungkin kalau domain name ku sudah berubah aku akan coba konten dengan bahasa inggris secara reguler. 

## Halaman
Halaman Post dan Index ku terpisah karena asumsi awalku ialah pengunjung bisa memilih antara melihat post berdasarkan kategori Blog, Artikel, atau Log lalu melihat daftar berdasarkan tahun atau tag namun aku terasa redudan dan memakan tempat untuk navigasi jadi kedepan aku akan gabungkan fitur archive menjadi satu dengan tampilan utama post berdasarkan kategori dengan tombol tahun dan tags jika pengunjung inginkan.

Selain archive aku juga mempertimbangkan untuk menambah koleksi lain seperti galeri game game yang pernah kumainkan, review buku, dan memoar. Motivasi ku ingin membuat memoar sebagai pengingat buat diriku nanti di masa depan apa yang sudah ku lalui di masa lampau dan kenang kenangan nantinya.

Selagi ku memiliki waktu aku ingin membuat wiki atau dokumentasi seperti melakukan penelitian, menggunakan software atau hardware, dan guide game sebagai tempat untuk melihat lagi apa yang sudah kubuat dulunya dan coba mengajarkan orang lain bagaimana mereka bisa meraih hasil yang sama. Seperti tulisan yang kubuat ini sebagai motivasi untuk menulis hal hal teknikal karena hal yang aku suka ketika menulis adalah membuat konsep ku sendiri yang kubuat dari hasil tangkapanku dan hanya diriku lah yang tahu, dengan personal website sebagai long term project untuk mengubah konsep yang kuciptakan menjadi sesuatu yang orang lain mengerti dan mampu membantu orang lain.

[^wiki]: https://en.wikipedia.org/wiki/News_aggregator
[^rss-geeks]: https://www.howtogeek.com/115317/htg-explains-what-is-rss-and-how-can-i-benefit-from-using-it/
