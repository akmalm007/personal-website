---
date: 2025-12-19
title: "Monthly Log 5 - November 2025"
topics: Self Reflection
category: logs
tags: monthly project study learning life gaming 
header:
    image: "/assets/images/blog/2025-12-17-montly-log-5-november/winter.jpg"
    teaser: "/assets/images/blog/2025-12-17-montly-log-5-november/winter.jpg"
gallery:
    - url: /assets/images/blog/2025-12-17-montly-log-5-november/1765964994701.jpg
      image_path: /assets/images/blog/2025-12-17-montly-log-5-november/1765964994701.jpg
      title: "Listening Time"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965004606.jpg
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965004606.jpg      
      title: "I Love Luna"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965018007.jpg
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965018007.jpg
      title: "Since Play PGR I always listen to PGR OST"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965035832.jpg
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965035832.jpg
      title: "VSS is Goat and the music is arragement is different from Monster Siren"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965078462.jpg
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965078462.jpg
      title: "I always like listening Ed Zitron ranting about Tech"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965120318.jpg
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/1765965120318.jpg
      title: "Overall Stats"
gallery2:
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/Screenshot from 2025-12-19 09-47-59.png
      image_path: ../assets/images/blog/2025-12-17-montly-log-5-november/Screenshot from 2025-12-19 09-47-59.png
      title: "Steam Report"
    - url: ../assets/images/blog/2025-12-17-montly-log-5-november/Screenshot from 2025-12-19 09-57-34.png
      image_path:  ../assets/images/blog/2025-12-17-montly-log-5-november/Screenshot from 2025-12-19 09-57-34.png      
      title: "Funny Stats"
---
Aku tahu aku tahu log bulan November tapi ditulis di bulan Desember memang kegiatan apa yang membuat lupa buat blogging?
Kebanyakan kegiatan ku selama November adalah adaptasi dengan workflow pekerjaan, lalu daily life di kantor pulang dan pergi kemudian karena dari dulu aku *yearning* perbaiki laptop ku ini makanya selama 3 minggu terakhir aku sibuk buat preparasinya dari software hingga hardware. Akan ada blog tersendiri untuk itu.

# Minggu ke-1 
- Minggu ini aku sudah efektif bekerja dan pekerjaan pertama aku adalah mempersiapakan Infrastruktur Cloud untuk hosting dalam 6 bulan kedepannya, pekerjaan ku meliputi mempersiapkan container untuk aplikasi, lalu konfigurasi dengan instalasi Docker, Tmux, dan Vim jika remote access.
- Aku juga isi minggu ini dengan melakukan back up ke laptop lama untuk persiapan perpindahan ke Linux, metode backup yang ku pakai adalah dengan command `rsync` dan command ini mulai kupakai setiap saat ketika ada kesempatan dan menjadi arsenal ku setiap kali ingin memidahkan aplikasi ke remote host. Aku mungkin akan buat blog tersendiri bagaimana aku pakainya dan command ini bisa dipakai lewat WSL2.
- Aku juga mulai explore hobi tentang self hosting dengan mencoba instalasi Pi Hole di laptop sebagai DNS server dan mencoba kemampuannya dalam local domain name dan blocking ads tapi aku masih belum dapat use case yang tepat jadi project ini aku tinggalkan sementara waktu.

# Minggu ke-2  
- Minggu ini memulai *painful* proses yang mana aku mencoba membuat Docker Compose untuk project yang sedang dikerjakan namun aku belum tahu spesifikasi serta bagaimana aplikasi itu *behave*, dan proses ini memakan hampir 2 minggu lebih untuk setidaknya bisa berjalan aplikasinya di local namun akan berbeda lagi nantinya ketika di Cloud.
- Aku juga mulai latihan kembali instalasi Arch secara manual dengan Virtualbox, karena layar laptop ku rusak aku memakai monitor milik kantor tapi monitor kantor juga sama rusaknya sehingga tidak nyaman untuk dipakai bekerja setidaknya aku masih bisa melihat warna di monitor tersebut.
- Pelan pelan juga aku mulai bener bener muak dengan performa di Windows, setiap kali aku build image buat project pasti SSD loadnya selalu 100% kemudian suhunya selalu naik mencapai 70 derajat membuat ku menghabiskan waktu menunggu laptop ini *cooldown* sebelum memulai kembali. 

# Minggu ke-3
- Minggu adalah tahapan pertamaku dalam service laptop, hal pertama yang aku lakukan mengganti pasta laptop yang sudah berumur 2 tahun, performanya sudah turun dan selalu overheat ketika dibawa main sekarang sudah stabil performanya dan kedepannya aku ingin mencoba paste lain. Aku sudah buat post nya di [Facebook](https://www.facebook.com/share/p/1GJHu1Bax2/).
- Di bulan ini juga aku mulai posting update atau berita baru tentang teknologi topik ku adalah Linux dan AI Data Center di Facebook menurutku story seperti cocok di FB yang tidak panjang dan terkesan umum lalu aku bisa memakai pembawaan yang sarkas ataupun serius. Aku sendiri bukan pembenci AI hanya bagaimana jurnalis dan marketing *boasting* dengan kemampuannya itu menyebalkan apalagi aku ada beberapa piece yang pernah kutulis membahas tentang Data Center yang tidak *sustainable* buat jangka panjang, aku mungkin akan membuat piece khusus tentang ini karena ada project yang menarik yaitu menjalankannya lewat komputer rumah. 
Bukan berarti aku akan berhenti blogging di website ku hanya saja aku ada kekhawatiran yaitu project ini memakai versi software yang lama dan ketika aku mencoba upgrade ke versi terbaru ternyata sulit, setelah selesai install Linux di laptop utama ternyata instalasinya mudah dan aku bisa upload kembali seperti biasa.
- Pekerjaan sendiri pun aku berhasil membuat aplikasinya berjalan di remote server, dan menantikan perkembangan berikutnya. 
- Minggu ini aku juga mulai riset part untuk upgrade dan service laptop ku ini sekali lagi itu akan ada blognya sendiri.

# Minggu ke-4
- Part berikutnya yang ingin aku gantikan adalah baterai karena minggu ini aku disarankan buat menunggu terlebih dahulu agar mentor ku lihat harganya di mall dan jika murah maka ambil kalau tidak maka beli online, suprise suprise harganya Rp. 650.000 dan hampir Rp. 700.000 sedangkan membeli online harganya Rp. 500.000 dan itu sudah FULL HD selain itu aku juga membeli baterai dan memasangnya pada laptop ini. 
- Selama minggu ini aku juga latihan instalasi Arch mulai dengan langsung di Virtualbox kemudian melakukan SSH dari VM ke terminal laptop ini, lalu mencoba bootloader macam Limine dan Refind, aku masih gagal implementasinya karena itu aku memakai GRUB dan di saat ini aku juga definisikan package yang akan ku install.
- Kerjaan sendiri aku mencoba melakukan deployment secara manual lewat SSH, aku akui bukan approach DevOps dan masih cara lama seperti SysAdmin di sini departmen IT masih kurang dari segi dokumentsai dan man power. Tapi menjadi learning oppportunity juga bagaimana grow dari sini.
- Selain itu Mentor ku juga punya inisiatif untuk membuat aplikasi atau service mirip seperti Hostinger dengan memberikan cloud computing ke orang awam denga hardware pribadi dalam kata lain memiliki server sendiri, part ini membuat ku excited tapi di sisi lain arah nya tidak meyakinkan buat ku mungkin aku akan buatkan blog tentang perihal ini.

Dengan kegiatan yang berubah dan upgrade laptop ini yang memakan konsentrasi ku dalam membuat blog apalagi aku juga harus mengisi log book pribadi yang diterapkan oleh kemenaker untuk menilai pekerjaan kita, regardless aku tidak akan menyerah untuk website ini dan aku akan tetap blogging karena aku senang menulis.

# Media Diet
Aku mungkin bakal perlu app yang keep track terutama reading timeku, dan tidak banyak berubah media yang aku konsumsi saat ini.

## Reading
Tidak banyak baca buku di bulan ini kemudian membaca blog juga jarang ada beberapa noteable blog yang sudah kubaca seperti Ed Zitron [NVIDA is Not Enron](https://www.wheresyoured.at/nvidia-isnt-enron-so-what-is-it/) dan dia akan membuat podcastnya. Sebenarnya aku bisa baca ketika commute ke kantor saat berangkat dan pulang namun di salah satu koridor pasti ada bangku kosong dan aku pusing ketika membaca saat berkendara takutnya mual makanya sering kali aku hanya melihat keluar atau mendengarkan musik. 
## Music
Aku akan membiarkan Youtube raport berbicara dengan taste musik ku dalam setahun kemarin.
{% include gallery caption="My Youtube Music Yearly Raport" %}

## Podcast
Aku tidak mendengarkan podcast banyak podcast di bulan November keseringan adalah mendengar monolog dari Ed Zitron.

## Sports
### NFL
Ketika aku menulis ini season NFL sudah mau berakhir dan Kansas City tidak masuk ke playoff season, kemudian pemimpin AFC saat ini adalah Broncos dengan Charger memimpin di NFC. Performa Eagle suka tidak konsisten dari offensivenya dan terkadang defensivenya pun bisa let up.
Tim yang kelihatannya improve adalah Houston, Jaguar, dan Dallas?. Ini season pertama ku mengikuti NFL dari awal September sampai Akhir tahun ini jadi aku tidak bisa memberi banyak penjelasan.
### F1
Musim F1 sudah berakhir ketika aku tulis dan yang menang adalah Lando Norris kudos to him, lalu Max juga menggila sampai akhir musim dengan pangkas gap menjadi 2 points. Dia akan memakai nomor 3 untuk musim depannnya dan karena musim baru dengan regulasi baru maka aku tidak akan menjagokan Tim manapun namun aku berharap Ferrari dan RB bisa bangkit dengan manajemen yang baru.
## Gaming
### PGR
Hal yang sempat menahan diriku untuk berpindah ke Linux adalah apakah PGR bekerja di Linux karena aku lihat aplikasi seperti Litrus maupun Babylonia Terminal tidak bekerja dengan baik, dan ada satu project lagi bernama [Twintaillauncher](https://twintaillauncher.app/) aku lihat discord server mereka dan lead developernya kelihatan keren dan tidak ada komplain signifkan di Game jadi aku coba dan jatuh cinta dengan launcher yang kupikir bakal menyulitkan dan ternyata plug and play dari tahapan awal install Game sampai men-*download* in-game semua berjalan lancar dan aku tidak menemukan isu seperti Crash di PPC dan Cust Scene yang bikin crash.

Dengan pengalaman yang lancar ini aku langsung donasi ke project dengan berharap bisa membantu, aku masih ingat kata Louis Rossman kalau jika ada produk sekalipun gratis yang memberikan value ke dirimu maka "sent them a buck" dan TTL memberikan value yang besar buatku.

### Left 4 Dead 2
Tidak banyak game juga yang kumainkan di Steam selama setahun terkahir karena juga tidak ingin menganggu fokus ketika ingin mencari pekerjaan, sekarang ini aku mulai pick up lagi game game seperti ET2 dan Stardew Valley, aku sudah sudah record baru lagi di L4D2. Aku harap bisa lebih banyak main lagi jika ada kesempatan terutama dengan mesin baru nantinya.
{% include gallery id="gallery2" layout="half" caption="Steam Report" %}

# Looking Forward
Well tidak banyak di bulan Desember sebenarnya karena yang aku butuhkan buat service laptop, upgrade, dan perlengkapan kerja sudah terpenuhi jadi selanjutnya adalah meningkatkan skill teknikal ku dan writing ku kedepannya. Ingin coba memakai Tiling Manager dan mulai bisa konsisten buat belajar K8S nantinya, mentor ku ingin berencana membuat protokol?, hypervisor?, orchestration?, virtualbox? yang akan dipakai buat cloud infrastruktur aku sendiri buat sekarang hanya melihatnya sebagai internal tools dan sejujurnya aku juga skeptis karena dia riset dengan Chabot. 

Disisi lain Aku kecewa karena menurutku tidak standard industri seperti K8S atau tools lain yang sudah ada di CNDF kemudian aku sudah terbayang direksi yang bisa diambil buat divisi IT di tempat ku dan aku juga tidak ingin menghancurkan ambisinya karena kalau project ini bekerja bakal menarik untuk dijadikan portofolio.
