# Atistik - Uygulama İkonu Rehberi

## Android İkonu

Android için uygulama ikonunu şu klasöre koyun:

```
android/app/src/main/res/
```

### Gerekli İkon Boyutları:

1. **mipmap-mdpi/** - 48x48 px
2. **mipmap-hdpi/** - 72x72 px
3. **mipmap-xhdpi/** - 96x96 px
4. **mipmap-xxhdpi/** - 144x144 px
5. **mipmap-xxxhdpi/** - 192x192 px

Her klasöre `ic_launcher.png` adıyla kaydedin.

### Kolay Yöntem - flutter_launcher_icons Paketi:

1. `pubspec.yaml` dosyasına ekleyin:

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png"
  adaptive_icon_background: "#FF0000"
  adaptive_icon_foreground: "assets/icon/app_icon_foreground.png"
```

2. İkon dosyanızı `assets/icon/app_icon.png` olarak kaydedin (1024x1024 px)

3. Komutu çalıştırın:
```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

## iOS İkonu

iOS için ikonlar:

```
ios/Runner/Assets.xcassets/AppIcon.appiconset/
```

### Gerekli Boyutlar:
- 20x20, 29x29, 40x40, 60x60, 76x76, 83.5x83.5, 1024x1024 (çeşitli @2x ve @3x versiyonları)

## Uygulama Adı Değişikliği

### Android:
`android/app/src/main/AndroidManifest.xml` dosyasında:
```xml
<application
    android:label="Atistik"
    ...>
```

### iOS:
`ios/Runner/Info.plist` dosyasında:
```xml
<key>CFBundleName</key>
<string>Atistik</string>
<key>CFBundleDisplayName</key>
<string>Atistik</string>
```

## Hızlı Başlangıç

1. 1024x1024 px boyutunda bir ikon hazırlayın
2. `assets/icon/` klasörü oluşturun
3. İkonu `app_icon.png` olarak kaydedin
4. `flutter_launcher_icons` paketini kullanın (yukarıdaki adımlar)
