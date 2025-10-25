# Atistik - Yarış Atı İstatistikleri Uygulaması

TJK (Türkiye Jokey Kulübü) verilerini kullanarak at ve yarış istatistiklerini görüntüleme uygulaması.

## 🎯 Özellikler

### ✅ At Sorgulama
- At adı, ırk, cinsiyet, yaş ile arama
- Baba/Anne adı ile filtreleme
- Sahip, antrenör, yetiştirici bilgileri
- Ölen atları dahil etme seçeneği
- Tam eşleşme öncelikli sıralama

### ✅ At Detayları
- Kimlik bilgileri (yaş, cinsiyet, ırk, orijin)
- İstatistikler (toplam koşu, kazanç, kazanma %, tabela)
- Geçmiş yarış performansları
- Detaylı yarış bilgileri (tarih, şehir, mesafe, pist, derece, jokey, ikramiye)

### ✅ Yarış Sorgulama
- Tarih aralığı ile arama
- Şehir filtresi
- Koşu cinsi filtresi
- Mesafe filtresi
- Baba/Anne adı ile arama

## 🚀 Kurulum

### Gereksinimler
- Flutter SDK
- Python 3.11+
- Railway hesabı (API deploy için)

### API Sunucusu

**Yerel Çalıştırma:**
```bash
pip install -r requirements.txt
python api_server.py
```

**Railway Deploy:**
1. GitHub'a yükle: `api_server.py`, `requirements.txt`, `Procfile`, `runtime.txt`, `railway.json`
2. Railway.app'te "Deploy from GitHub"
3. Otomatik deploy edilecek

### Flutter Uygulaması

**Geliştirme:**
```bash
flutter pub get
flutter run
```

**APK Derleme:**
```bash
flutter build apk --release
```

APK konumu: `build/app/outputs/flutter-apk/app-release.apk`

## 📁 Proje Yapısı

```
atistik/
├── lib/
│   ├── main.dart                 # Ana uygulama
│   ├── screens/                  # Ekranlar
│   │   ├── home_screen.dart
│   │   ├── horse_search_screen.dart
│   │   ├── horse_detail_screen.dart
│   │   └── race_search_screen.dart
│   ├── services/                 # API servisleri
│   │   └── tjk_api_service.dart
│   ├── theme/                    # Tema ayarları
│   │   └── app_theme.dart
│   └── widgets/                  # Ortak widget'lar
│       └── bottom_nav_bar.dart
├── api_server.py                 # Python Flask API
├── requirements.txt              # Python bağımlılıkları
├── Procfile                      # Railway deploy config
├── runtime.txt                   # Python versiyonu
└── railway.json                  # Railway ayarları
```

## 🔧 Yapılandırma

### API URL Değiştirme

`lib/services/tjk_api_service.dart`:
```dart
static const String baseUrl = 'https://YOUR-RAILWAY-URL.up.railway.app';
```

## 📚 Rehberler

- **RAILWAY_KURULUM.md** - Railway deploy rehberi
- **HIZLI_ÇÖZÜM.md** - Hızlı başlangıç
- **ARKADAŞLARA_GÖNDERME_REHBERİ.md** - APK paylaşma

## 🛠️ Teknolojiler

**Frontend:**
- Flutter
- Material Design
- HTTP istekleri

**Backend:**
- Python Flask
- BeautifulSoup4 (web scraping)
- Flask-CORS

**Deploy:**
- Railway (API)
- GitHub (versiyon kontrol)

## 📱 Ekran Görüntüleri

- Ana Sayfa
- At Sorgulama
- At Detayları
- Yarış Sorgulama

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📄 Lisans

Bu proje MIT lisansı altındadır.

## 🙏 Teşekkürler

- TJK (Türkiye Jokey Kulübü) - Veri kaynağı
- Flutter Team
- Railway - Ücretsiz hosting

## 📞 İletişim

Sorularınız için issue açabilirsiniz.

---

**Not:** Bu uygulama TJK'nın resmi uygulaması değildir. Sadece eğitim amaçlıdır.
