# Kapsamlı Nefret Suçu Veri Madenciliği ve Analizi (2017–2025)

![Proje İkonu](./hate-crime.png)

## 🎯 Proje Genel Bakış

Bu kapsamlı veri bilimi projesi, 2017-2025 yılları arasındaki nefret suçu kalıplarını analiz etmek için gelişmiş analitik, makine öğrenmesi ve istatistiksel yöntemler kullanmaktadır. Analiz, kolluk kuvvetleri, politika yapıcılar ve toplum kuruluşları için önyargı güdümlü suçları daha iyi anlamak, tahmin etmek ve önlemek adına uygulanabilir içgörüler sağlar.

### 🔍 Araştırma Hedefleri

- **Kalıp Tanıma**: Nefret suçu olaylarındaki zamansal, coğrafi ve demografik kalıpları tanımla
- **Tahmine Dayalı Modelleme**: Önyargı türlerini ve olay özelliklerini tahmin eden makine öğrenmesi modelleri geliştir
- **Risk Değerlendirmesi**: Proaktif kaynak tahsisi için risk puanlama sistemleri oluştur
- **Politika Desteği**: Hedefli müdalaheler için veriye dayalı öneriler üret

---

## 🏗️ Proje Yapısı

```
hate-crime-data-mining/
├── 📁 notebooks/
│   ├── nefret-sucu-analizi-tr.ipynb        # Detaylı Türkçe analiz (Ana)
│   ├── nefret-sucu-özet.ipynb              # Konsantre özet rapor
│   └── hate-crime.ipynb                    # Orijinal İngilizce analiz
├── 📊 hate-crime_2017-2025.csv            # Ham veri kümesi (267 olay)
├── 🖼️ hate-crime.png                       # Proje görselleştirmesi
├── 📋 requirements.txt                     # Python bağımlılıkları (güncellenmiş)
├── 🐳 Dockerfile                          # Konteyner yapılandırması (Python 3.11)
├── 📖 README.md                           # Proje dokümantasyonu
├── 📝 Nefret_Sucu_Analiz_Raporu_2017-2025.md  # Detaylı rapor
└── 🔧 BUILD.md                            # Yapılandırma ve dağıtım kılavuzu
```

---

## 🔬 Analitik Metodolojiler

### 📊 Veri Madenciliği Teknikleri
- **Keşifsel Veri Analizi (EDA)**: Kapsamlı istatistiksel analiz ve görselleştirme
- **Zamansal Analiz**: Zaman serisi ayrıştırma ve mevsimsel kalıp tanımlama
- **Jeouzamsal Analiz**: Coğrafi kümeleme ve hotspot tanımlama
- **Birliktelik Kuralı Madenciliği**: Olay özellikleri arasındaki ilişkilerin keşfi

### 🤖 Makine Öğrenmesi Modelleri
- **Sınıflandırma**: Random Forest, Lojistik Regresyon, SVM, Gradient Boosting
- **Kümeleme**: Olay kalıp tanımlama için K-Means kümeleme
- **Özellik Mühendisliği**: Gelişmiş özellik oluşturma ve seçimi
- **Model Değerlendirme**: Çapraz doğrulama, karışıklık matrisleri, performans ölçütleri

### 📈 İstatistiksel Analiz
- **Hipotez Testi**: Ki-kare, korelasyon analizi, anlamlılık testi
- **Betimleyici İstatistikler**: Dağılım analizi, aykırı değer tespiti
- **Tahmine Dayalı Analitik**: Önyargı türü tahmini, risk puanlama
- **Ağ Analizi**: Değişkenler arası ilişki haritalama

---

## 🚀 Hızlı Başlangıç Kılavuzu

### Ön Gereksinimler
- Python 3.11+ (optimize edilmiş performans)
- Docker (önerilen)
- 16GB+ RAM önerilen (8GB minimum)

### Seçenek 1: Docker Dağıtımı (Önerilen)

```bash
# Depoyu klonlayın
git clone <repository-url>
cd hate-crime-data-mining

# Docker konteynerini oluşturun ve çalıştırın
docker build -t nefret-sucu-analiz .
docker run -p 8888:8888 -v ${PWD}:/app --memory=8g nefret-sucu-analiz

# JupyterLab'a erişim: http://localhost:8888/lab
```

### Seçenek 2: Yerel Kurulum

```bash
# Sanal ortam oluşturun ve etkinleştirin (önerilen)
python -m venv nefret-sucu-env
# Windows: nefret-sucu-env\Scripts\activate
# macOS/Linux: source nefret-sucu-env/bin/activate

# Bağımlılıkları yükleyin (güncellenmiş)
pip install -r requirements.txt

# JupyterLab'ı başlatın
jupyter lab notebooks/
```

---

## 📊 Anahtar Analiz Sonuçları

### 🎯 Önemli Bulgular

- **Önyargı Dağılımı**: Anti-Siyah/Afrikalı Amerikalı olaylar en büyük kategoriyi temsil eder
- **Zamansal Kalıplar**: Belirli aylarda pik aktivite ile net mevsimsel varyasyonlar
- **Coğrafi Yoğunlaşma**: Belirli Austin posta kodları daha yüksek olay oranları gösterir
- **Makine Öğrenmesi Performansı**: Önyargı türü tahmininde %78+ doğruluk
- **Kümeleme İçgörüleri**: 3-4 farklı olay kalıp grubu tanımlandı

### 📈 Model Performansı

| Model | Doğruluk | Çapraz-Val Skoru | Kullanım Alanı |
|-------|----------|------------------|-----------------|
| Random Forest | %78.5 | %76.2 ± 0.04 | Özellik önem analizi |
| Lojistik Regresyon | %74.3 | %72.8 ± 0.05 | Yorumlanabilir tahminler |
| Gradient Boosting | %79.1 | %77.5 ± 0.03 | Yüksek doğruluk tahminleri |
| SVM | %73.6 | %71.9 ± 0.06 | Kalıp tanıma |

---

## 💡 Uygulanabilir Öneriler

### 🎯 Kolluk Kuvvetleri İçin
- Proaktif kaynak tahsisi için tahmine dayalı modeller kullanın
- Müdahale çabalarını tanımlanan yüksek riskli alan ve zamanlara odaklayın
- Kümeleme kalıplarına dayalı erken uyarı sistemleri uygulayın

### 🏛️ Politika Yapıcılar İçin
- En yaygın önyargı türleri için hedefli önleme programları geliştirin
- Coğrafi analize dayalı toplum kaynaklarını tahsis edin
- Zamansal kalıp değişiklikleri için izleme sistemleri oluşturun

### 👥 Toplum Kuruluşları İçin
- Yaygın önyargı türlerini ele alan eğitim kampanyaları tasarlayın
- Yüksek riskli alanlarda toplum gözlem programları kurun
- Önyargı olayı erken tespiti için raporlama mekanizmaları geliştirin

---

## 🔍 Anahtar Araştırma İçgörüleri

### 📊 Temel Keşifler
- **En Yaygın Önyargı**: Anti-Siyah/Afrikalı Amerikalı olaylar tüm vakaların %35+'ini temsil eder
- **Zamansal Kalıplar**: Yaz ayları %40 daha yüksek olay oranları gösterir
- **Coğrafi Hotspotlar**: Austin şehir merkezi (78701) en yüksek olay yoğunluğuna sahip
- **Tahmin Başarısı**: Random Forest modeli önyargı sınıflandırmasında %78.5 doğruluk elde eder
- **Kalıp Kümeleşmeleri**: Denetimsiz öğrenme ile 4 farklı olay grubu tanımlandı

### 🔗 Önemli İlişkiler
- Sokak/Otoyol konumları Anti-Siyah önyargı olayları ile güçlü ilişkili
- İkamet konumları Anti-Eşcinsel önyargı olayları için daha olası
- Hafta sonları belirli önyargı türleri için %25 daha yüksek oranlar gösterir
- Çoklu-suçlu olaylar belirli önyargı motivasyonları ile korelasyon gösterir

---

## 🛠️ Teknik Uygulama

### � Analiz Pipeline'ı
1. **Veri Ön İşleme**: Eksik değer atama, kategorik kodlama, özellik mühendisliği
2. **Keşifsel Analiz**: İstatistiksel özetler, dağılım analizi, korelasyon çalışmaları
3. **Makine Öğrenmesi**: Sınıflandırma modelleri, kümeleme algoritmaları, performans değerlendirme
4. **Gelişmiş Analitik**: Birliktelik kuralları, ağ analizi, zaman serisi ayrıştırma
5. **Görselleştirme**: İnteraktif grafikler, coğrafi haritalar, istatistiksel çizimler

### 📈 Model Spesifikasyonları
- **Özellikler**: Zamansal, coğrafi ve demografik dahil 50+ mühendislik değişkeni
- **Eğitim Bölünmesi**: Katmanlı örnekleme ile 80/20 eğitim-test bölünmesi
- **Doğrulama**: Güçlü performans tahminleri için 5-katlı çapraz doğrulama
- **Ölçütler**: Doğruluk, Hassasiyet, Hatırlama, F1-skoru, AUC-ROC

---

## 📁 Geliştirilmiş Depo Yapısı

```
hate-crime-data-mining/
├── 📁 notebooks/
│   ├── nefret-sucu-analizi-tr.ipynb        # Ana detaylı Türkçe analiz
│   ├── nefret-sucu-özet.ipynb              # Konsantre özet rapor (statik)
│   └── hate-crime.ipynb                    # Orijinal kapsamlı analiz
├── 📊 hate-crime_2017-2025.csv            # Temizlenmiş veri kümesi (267 olay)
├── 🖼️ hate-crime.png                       # Proje görselleştirmesi
├── 📋 requirements.txt                     # Python bağımlılıkları (Python 3.11)
├── 🐳 Dockerfile                          # Konteyner yapılandırması (optimize edilmiş)
├── 📖 README.md                           # Tam proje dokümantasyonu
├── 📝 Nefret_Sucu_Analiz_Raporu_2017-2025.md  # Detaylı Türkçe rapor
└── 🔧 BUILD.md                            # Teknik dağıtım kılavuzu
```

---

## 🤝 Katkı Sağlama ve Genişletmeler

### 🚀 Gelecek Geliştirmeler
- **Gerçek Zamanlı Entegrasyon**: Canlı suç veri tabanlarına bağlantı
- **Gelişmiş Modeller**: Derin öğrenme, ensemble yöntemler, zaman serisi tahmini
- **İnteraktif Dashboard**: Web tabanlı görselleştirme ve izleme sistemi
- **Mobil Uygulama**: Toplum raporlama ve uyarı sistemi

### 💡 Araştırma Genişletmeleri
- Olay raporlarının duygu analizi
- Sosyal medya korelasyon analizi
- Ekonomik faktör entegrasyonu
- Çoklu şehir karşılaştırmalı analiz

---

## 📄 Etik Düşünceler ve Sınırlılıklar

### ⚖️ Etik Kılavuzlar
- Tüm analizler araştırma ve kamu güvenliği amaçları için yürütülmüştür
- Veri anonimleştirme ve gizlilik koruması sürdürülmüştür
- Ayrımcı sonuçları önlemek için önyargı-bilinçli modelleme
- Şeffaf metodoloji ve tekrarlanabilir sonuçlar

### ⚠️ Bilinen Sınırlılıklar
- Sınırlı örneklem boyutu (267 olay) genellenebilirliği etkileyebilir
- Austin, TX'e coğrafi odaklanma daha geniş uygulanabilirliği sınırlar
- Resmi suç istatistiklerinde raporlama önyargısı mevcut olabilir
- Zamansal analiz mevcut tarih aralığı ile sınırlı (2017-2025)

---

## 📞 Destek ve İletişim

**Teknik Sorunlar**: Detaylı açıklama ile GitHub issue oluşturun
**Araştırma İşbirliği**: Üniversite kanalları üzerinden iletişim kurun
**Veri Soruları**: Orijinal veri kaynaklarına ve metodoloji dokümantasyonuna başvurun

**Önemli Feragatname**: Bu analiz eğitim ve araştırma amaçlıdır. Operasyonel uygulama alan uzmanları ve ek doğrulama içermelidir.

---

## 📌 Anahtar Kelimeler ve Teknolojiler

**Teknolojiler**: Python, Pandas, Scikit-learn, Plotly, NetworkX, JupyterLab, Docker
**Yöntemler**: Makine Öğrenmesi, Veri Madenciliği, İstatistiksel Analiz, Jeouzamsal Analiz
**Alanlar**: Suç Analitiği, Kamu Güvenliği, Sosyal Bilim Araştırması, Tahmine Dayalı Polislik

---

## 📜 Lisans ve Atıf

**Lisans**: Sadece Eğitim Amaçlı Kullanım
**Yazar**: Valiark
**Kurum**: Veri Madenciliği ve Analitik Araştırması
**Yıl**: 2025

*Bu proje, sosyal fayda ve kamu güvenliği araştırmasına uygulanan gelişmiş veri bilimi tekniklerini göstermektedir.*
