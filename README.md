# Mini Catalog 🛍️

Mini Catalog, **FakeStoreAPI** kullanarak gerçek zamanlı veri çeken modern arayüzlü bir ürün kataloğu ve sepet yönetim uygulamasıdır. Proje, Flutter'ın temel prensiplerini API entegrasyonunu ve state yönetimi mantığını anlamak için geliştirilmiştir.

## 🚀 Proje Resimleri
<img width="360" height="800" alt="Screenshot_20260420_161508" src="https://github.com/user-attachments/assets/03639673-30d9-4480-86eb-23ff0a9859b1" />
<img width="360" height="800" alt="Screenshot_20260420_161515" src="https://github.com/user-attachments/assets/2e7a3ebb-821b-4012-be3b-69bf33b5cb3f" />
<img width="360" height="800" alt="Screenshot_20260420_161451" src="https://github.com/user-attachments/assets/35bb8605-4214-4a78-be84-c17ca4e82831" />

## 🚀 Proje Hakkında

Bu uygulama aşağıdaki temel özellikleri içermektedir:
- **Dinamik Ürün Listeleme:** Ürünler REST API üzerinden anlık olarak çekilir.
- **Canlı Arama (Search):** Ürün başlıkları arasında gecikmesiz filtreleme yapılır.
- **Sepet Yönetimi:** Ürün ekleme, sepet sayacı ve toplam fiyat hesaplama özellikleri mevcuttur.
- **Ürün Detay Sayfası:** Her ürünün açıklaması ve görseli detaylı bir görünümde sunulur.

## 🛠️ Kullanılan Teknolojiler

- **Framework:** Flutter 3.41.6
- **Dil:** Dart
- **Paketler:** 
    - `http`: API isteklerini yönetmek için.
    - `convert`: JSON verilerini modele dönüştürmek için.

## 📂 Proje Yapısı

Görseldeki klasör mimarisine uygun olarak yapılandırılmıştır:

```text
lib/
├── main.dart               # Uygulama giriş noktası ve tema ayarları
├── models/
│   └── urun.dart           # Veri modeli ve JSON Factory
└── screens/
    ├── kesfet_sayfasi.dart      # Ana liste ve arama ekranı
    ├── sepet_sayfasi.dart       # Sepet özeti ve ödeme ekranı
    └── urun_detay_sayfasi.dart  # Detaylı ürün inceleme ekranı

## 📦 Kurulum

Bu projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları takip edin:

1. **Flutter SDK Kurulumu:** Flutter SDK'nın sisteminizde yüklü olduğundan emin olun. `flutter doctor` komutunu çalıştırarak her şeyin doğru şekilde kurulduğunu kontrol edin.

2. **Projeyi İndirin veya Klonlayın:** Projeyi GitHub'dan indirin veya klonlayın:
   ```bash
   git clone https://github.com/egejpg/flutter_mini_katalog/
   cd mini_katalog
   ```

3. **Bağımlılıkları Yükleyin:** Proje klasörüne girdikten sonra, gerekli paketleri yükleyin:
   ```bash
   flutter pub get
   ```

4. **Uygulamayı Çalıştırın:** Bir emülatör veya fiziksel cihaz bağlayarak uygulamayı başlatın:
   ```bash
   flutter run
   ```

   Alternatif olarak, belirli bir platform için çalıştırabilirsiniz (örneğin, Android için `flutter run -d android` veya iOS için `flutter run -d ios`).

## 🔧 Gereksinimler

- Flutter SDK (3.41.6 veya üzeri)
- Dart SDK (Flutter ile birlikte gelir)
- Android Studio veya Xcode (platforma göre)
- Bir emülatör veya fiziksel cihaz

