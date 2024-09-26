Veri Filtreleme: Uygulama, JSON'dan aldığı verileri filtreleyerek kullanıcıların iş ilanları arasında arama yapmasına olanak tanır. Çalışma şekline göre filtreleme özelliği eklenmiştir.

Favori İlanlar: Kullanıcılar, beğendikleri iş ilanlarını favorilere ekleyebilir. Favori ilanlar, özel bir sayfada kartlar şeklinde görüntülenir. Kullanıcı, bu kartlara tıkladığında ilgili iş ilanının detay sayfasına eklediği ilan gönderilir.

İş Detay Sayfası: Detay sayfasında, JSON'dan alınan verilerle iş tanımı, gereksinimler ve maaş aralığı gibi bilgiler kullanıcıya sunulmaktadır.

Özel Font Kullanımı: Uygulamada, Google'dan indirilen Coiny fontu kullanılarak estetik bir görünüm sağlanmıştır.

 1. **FavoriProvider**: Bu sınıf, favori ilanları yönetir. Kullanıcı bir ilanı favorilere ekleyebilir veya çıkarabilir. Ayrıca, bir ilan favorilerde olup olmadığını kontrol etme işlevi de vardır.
 2. **DetailPage**: İlan detaylarını gösteren sayfa. İlanın başlığı, şirket adı, çalışma şekli gibi bilgileri içerir ve kullanıcıya başvuru yapma veya kaydetme seçenekleri sunar.
 3. **FavPage**: Kullanıcının favori ilanlarını listeleyen sayfa. Eğer favori ilan yoksa bir mesaj gösterir, aksi takdirde favori ilanları bir liste halinde görüntüler.
 4. **HomePage**: Uygulamanın ana sayfasıdır. İş ilanları ve favori ilanlar arasında geçiş yapmayı sağlayan bir alt sekme navigasyonu içerir.
 5. **Cards**: İş ilanlarını listeleyen bir sayfa. JSON dosyasından verileri yükler ve kullanıcıların arama yapmasına ve filtre uygulamasına olanak tanır.
 6. **DetailCardWidget**: İlan detaylarını gösteren özel bir widget. İlanla ilgili ek bilgileri yapılandırmak için kullanılır. 

![image alt](https://github.com/silanadgzl/is_ilan/blob/main/ss1.jpeg?raw=true)
![image alt](https://github.com/silanadgzl/is_ilan/blob/main/ss2.jpeg?raw=true)


