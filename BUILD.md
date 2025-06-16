# 🔧 Yapılandırma ve Dağıtım Kılavuzu

Bu kılavuz, Nefret Suçu Veri Madenciliği projesinin farklı ortamlarda yapılandırılması, dağıtılması ve çalıştırılması için kapsamlı talimatlar sağlar.

## 📋 Ön Gereksinimler

### Sistem Gereksinimleri
- **İşletim Sistemi**: Windows 10/11, macOS 10.15+, veya Linux (Ubuntu 18.04+)
- **Bellek**: 16GB+ RAM önerilen (8GB minimum)
- **Depolama**: 5GB boş disk alanı
- **Ağ**: Paket indirmeleri için internet bağlantısı

### Yazılım Bağımlılıkları
- **Python**: 3.11 veya üzeri (performansı optimize edilmiş)
- **Docker**: En son sürüm (önerilen)
- **Git**: Depo klonlama için

## 🚀 Hızlı Başlangıç Seçenekleri

### Seçenek 1: Docker Dağıtımı (Önerilen)

Docker, en tutarlı ve taşınabilir dağıtım yöntemini sağlar.

#### Adım 1: Docker Kurulumu
```powershell
# Windows için Docker Desktop indirin
# macOS için Docker Desktop indirin
# Linux için Docker Engine kurulumunu takip edin
```

#### Adım 2: Projeyi Klonlayın ve Yapılandırın
```bash
# Depoyu klonlayın
git clone <repository-url>
cd hate-crime-data-mining

# Docker imajını oluşturun (optimize edilmiş Python 3.11)
docker build -t nefret-sucu-analiz .

# Konteyneri çalıştırın (gelişmiş yapılandırma ile)
docker run -p 8888:8888 -v ${PWD}:/app --memory=8g nefret-sucu-analiz
```

#### Adım 3: Uygulamaya Erişim
- **Ana Analiz**: `http://localhost:8888/tree/notebooks/nefret-sucu-analizi-tr.ipynb`
- **Özet Rapor**: `http://localhost:8888/tree/notebooks/nefret-sucu-özet.ipynb`
- **JupyterLab**: `http://localhost:8888/lab` (gelişmiş arayüz)

### Seçenek 2: Yerel Python Kurulumu

Geliştirme veya özel ortamlar için projeyi doğrudan Python ile çalıştırabilirsiniz.

#### Adım 1: Python Ortamını Kurun
```powershell
# Sanal ortam oluşturun (önerilen)
python -m venv nefret-sucu-env

# Sanal ortamı etkinleştirin
# Windows:
nefret-sucu-env\Scripts\activate
# macOS/Linux:
source nefret-sucu-env/bin/activate
```

#### Adım 2: Bağımlılıkları Yükleyin
```bash
# Temel gereksinimleri yükleyin (güncellenmiş ve optimize edilmiş)
pip install -r requirements.txt

# Jupyter Lab'ı başlatın (gelişmiş arayüz)
jupyter lab notebooks/
```

#### Adım 3: Notebook'ları Çalıştırın
- **Ana Analiz**: `nefret-sucu-analizi-tr.ipynb` - Detaylı, teknik analiz
- **Özet Rapor**: `nefret-sucu-özet.ipynb` - Konsantre, statik sonuçlar

## 🐳 Docker Yapılandırma Detayları

### Güncellenmiş Dockerfile Özellikleri
Proje, veri bilimi iş akışları için optimize edilmiş çok aşamalı Dockerfile içerir:

```dockerfile
# Python 3.11 ile optimize edilmiş performans
FROM python:3.11-slim as base

# Sistem bağımlılıklarını yükle (derleyici ve kütüphaneler)
RUN apt-get update && apt-get install -y \
    gcc g++ gfortran \
    libopenblas-dev liblapack-dev \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /app

# Python paketlerini optimize edilmiş şekilde yükle
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Proje dosyalarını kopyala
COPY . .

# JupyterLab portunu aç (güvenlik ile)
EXPOSE 8888

# Türkçe dil desteği ve optimize edilmiş JupyterLab başlatma
ENV LANG=tr_TR.UTF-8
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", \
     "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", \
     "--notebook-dir=/app/notebooks"]
```

### Özelleştirilmiş Docker Komutları

#### Geliştirme Modu
```bash
# Geliştirme için hacim bağlama ile çalıştır
docker run -p 8888:8888 -v ${PWD}:/app --name nefret-analiz-dev nefret-sucu-analiz

# Bellek limitleri ile çalıştır (büyük veri setleri için)
docker run -p 8888:8888 --memory=16g --cpus=8 nefret-sucu-analiz
```

#### Üretim Modu
```bash
# Arka plan servisi olarak çalıştır
docker run -d -p 8888:8888 --name nefret-sucu-servisi --restart=always nefret-sucu-analiz

# Servis durumunu kontrol et
docker logs nefret-sucu-servisi

# Servisi durdur
docker stop nefret-sucu-servisi
```

## 📦 Paket Bağımlılıkları

### Temel Gereksinimler (requirements.txt)
Güncellenmiş ve optimize edilmiş paket listesi:

```python
# === Temel Veri İşleme (Base Data Processing) ===
pandas>=2.1.0                 # Gelişmiş veri manipülasyonu
numpy>=1.24.0                 # Sayısal hesaplamalar
scipy>=1.11.0                 # İstatistiksel hesaplamalar

# === Makine Öğrenmesi (Machine Learning) ===
scikit-learn>=1.3.0          # ML algoritmaları ve araçları
xgboost>=1.7.0               # Gradient boosting
imbalanced-learn>=0.11.0     # Dengesiz veri kümeleri

# === Görselleştirme (Visualization) ===
matplotlib>=3.7.0            # Temel grafikler
seaborn>=0.12.0              # İstatistiksel görselleştirme
plotly>=5.15.0               # İnteraktif grafikler
wordcloud>=1.9.0             # Kelime bulutları

# === Notebook Ortamı (Notebook Environment) ===
jupyterlab>=4.0.0            # Modern notebook arayüzü
ipywidgets>=8.1.0            # İnteraktif widget'lar
ipython>=8.14.0              # Gelişmiş Python shell

# === Gelişmiş Analitik (Advanced Analytics) ===
networkx>=3.1.0              # Ağ analizi
mlxtend>=0.22.0              # Birliktelik kuralları
statsmodels>=0.14.0          # İstatistiksel modelleme
```

### Performans ve Güvenlik Optimizasyonları
```python
# === Performans (Performance) ===
numba>=0.57.0                # JIT derleme ile hızlandırma
joblib>=1.3.0                # Paralel işleme
dask>=2023.7.0               # Büyük veri işleme

# === Güvenlik ve Kalite (Security & Quality) ===
bandit>=1.7.0                # Güvenlik analizi
safety>=2.3.0                # Güvenlik açığı taraması
```

## 🔧 Ortam Yapılandırması

### JupyterLab Yapılandırması
Optimal performans için özel JupyterLab yapılandırması:

```python
# jupyter_lab_config.py
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888
c.ServerApp.open_browser = False
c.ServerApp.allow_root = True
c.ServerApp.token = ''
c.ServerApp.password = ''
c.ServerApp.notebook_dir = '/app/notebooks'

# Türkçe dil desteği
c.ServerApp.tornado_settings = {
    'headers': {
        'Content-Language': 'tr-TR',
    }
}
```

### Ortam Değişkenleri
Yapılandırma için ortam değişkenlerini ayarlayın:

```bash
# .env dosyası
JUPYTER_PORT=8888
DATA_PATH=./hate-crime_2017-2025.csv
RESULTS_PATH=./results/
LOG_LEVEL=INFO
PYTHONPATH=/app
LANG=tr_TR.UTF-8
```

## 🔍 Sorun Giderme

### Yaygın Sorunlar ve Çözümleri

#### Docker Sorunları

**Sorun**: Docker konteyneri başlatılamıyor
```powershell
# Docker servis durumunu kontrol edin
docker --version
docker ps

# Konteyner günlüklerini görüntüleyin
docker logs <container-id>

# İmajı yeniden oluşturun
docker build --no-cache -t nefret-sucu-analiz .
```

**Sorun**: 8888 portu zaten kullanımda
```powershell
# Farklı port kullanın
docker run -p 8889:8888 nefret-sucu-analiz

# Veya mevcut işlemi sonlandırın
# Windows:
netstat -ano | findstr :8888
taskkill /PID <PID> /F

# macOS/Linux:
lsof -ti:8888 | xargs kill -9
```

#### Python Kurulum Sorunları

**Sorun**: Paket kurulum hataları
```bash
# pip'i güncelleyin
pip install --upgrade pip

# Ayrıntılı çıktı ile yükleyin
pip install -r requirements.txt -v

# Alternatif olarak conda kullanın
conda install --file requirements.txt
```

**Sorun**: Analiz sırasında bellek hataları
```python
# Test için veri kümesi boyutunu azaltın
df_sample = df.sample(n=1000, random_state=42)

# Büyük işlemler için parçalama kullanın
for chunk in pd.read_csv('data.csv', chunksize=5000):
    process_chunk(chunk)

# Bellek kullanımını optimize edin
import gc
gc.collect()
```

#### Notebook Sorunları

**Sorun**: Kernel çöküyor veya yeniden başlıyor
- Bellek tahsisini artırın
- Kernel'i yeniden başlatın ve hücreleri sırayla çalıştırın
- Sonsuz döngü veya bellek sızıntılarını kontrol edin

**Sorun**: Görselleştirmeler eksik
```bash
# Ek backend'leri yükleyin
pip install ipympl
jupyter nbextension enable --py widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```

## 📊 Performans Optimizasyonu

### Bellek Yönetimi
```python
# Bellek kullanımını izleyin
import psutil
import pandas as pd

def check_memory():
    memory = psutil.virtual_memory()
    print(f"Toplam bellek: {memory.total / (1024**3):.1f} GB")
    print(f"Kullanım: {memory.percent}%")
    print(f"Mevcut: {memory.available / (1024**3):.1f} GB")

# Büyük değişkenleri temizleyin
def cleanup_memory(*vars_to_delete):
    for var in vars_to_delete:
        if var in globals():
            del globals()[var]
    import gc
    gc.collect()
```

### Hesaplama Optimizasyonu
```python
# Paralel işleme kullanın
from joblib import Parallel, delayed
import multiprocessing

def parallel_process(func, data_list, n_jobs=-1):
    """Paralel işleme için yardımcı fonksiyon"""
    if n_jobs == -1:
        n_jobs = multiprocessing.cpu_count()
    
    results = Parallel(n_jobs=n_jobs)(
        delayed(func)(item) for item in data_list
    )
    return results

# Pandas işlemlerini optimize edin
def optimize_dataframe(df):
    """DataFrame'i bellek için optimize et"""
    for col in df.select_dtypes(include=['object']):
        if df[col].nunique() < len(df) * 0.5:
            df[col] = df[col].astype('category')
    
    for col in df.select_dtypes(include=['int64']):
        if df[col].min() >= 0 and df[col].max() < 255:
            df[col] = df[col].astype('uint8')
        elif df[col].min() >= -128 and df[col].max() < 127:
            df[col] = df[col].astype('int8')
    
    return df
```

## 🧪 Test ve Doğrulama

### Veri Doğrulama
```python
def validate_hate_crime_data(df):
    """Nefret suçu verilerini doğrula"""
    
    # Temel doğrulamalar
    assert df.shape[0] > 0, "Veri kümesi boş"
    assert 'Date of Incident' in df.columns, "Olay tarihi sütunu eksik"
    assert 'Bias' in df.columns, "Önyargı sütunu eksik"
    
    # Tarih doğrulaması
    date_nulls = df['Date of Incident'].isna().sum()
    if date_nulls > 0:
        print(f"Uyarı: {date_nulls} eksik tarih bulundu")
    
    # Önyargı türü doğrulaması
    bias_nulls = df['Bias'].isna().sum()
    if bias_nulls > 0:
        print(f"Uyarı: {bias_nulls} eksik önyargı etiketi bulundu")
    
    # Yıl aralığı doğrulaması
    years = pd.to_datetime(df['Date of Incident']).dt.year
    print(f"Veri aralığı: {years.min()} - {years.max()}")
    
    return True

# Kullanım
# validate_hate_crime_data(df)
```

### Model Testi
```python
def comprehensive_model_test(model, X, y):
    """Kapsamlı model testi"""
    from sklearn.model_selection import cross_val_score, StratifiedKFold
    from sklearn.metrics import classification_report
    
    # Çapraz doğrulama
    cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
    cv_scores = cross_val_score(model, X, y, cv=cv, scoring='accuracy')
    
    print(f"Çapraz Doğrulama Sonuçları:")
    print(f"Ortalama Doğruluk: {cv_scores.mean():.3f} (+/- {cv_scores.std() * 2:.3f})")
    print(f"Minimum Doğruluk: {cv_scores.min():.3f}")
    print(f"Maksimum Doğruluk: {cv_scores.max():.3f}")
    
    return cv_scores
```

## 📁 Proje Yapısı Doğrulaması

Proje yapınızın şu şekilde olduğundan emin olun:
```
hate-crime-data-mining/
├── notebooks/
│   ├── nefret-sucu-analizi-tr.ipynb    # Ana detaylı analiz
│   ├── nefret-sucu-özet.ipynb          # Konsantre özet rapor
│   └── hate-crime.ipynb                # Orijinal İngilizce analiz
├── hate-crime_2017-2025.csv            # Veri kümesi
├── hate-crime.png                      # Proje görseli
├── requirements.txt                     # Güncellenmiş bağımlılıklar
├── Dockerfile                          # Optimize edilmiş konteyner
├── README.md                           # Proje dokümantasyonu
├── BUILD.md                            # Bu yapılandırma kılavuzu
├── Nefret_Sucu_Analiz_Raporu_2017-2025.md  # Detaylı rapor
└── .env                                # Ortam değişkenleri (opsiyonel)
```

## 🚀 Dağıtım Seçenekleri

### Bulut Dağıtımı

#### Google Colab
```python
# Colab'da kurulum için ilk hücrede:
!pip install -r requirements.txt
!pip install --upgrade pandas scikit-learn plotly

# Türkçe dil desteği
import locale
locale.setlocale(locale.LC_ALL, 'tr_TR.UTF-8')
```

#### Azure Machine Learning
```python
# Azure ML ortamı için
from azureml.core import Environment, ScriptRunConfig
from azureml.core.conda_dependencies import CondaDependencies

# Conda bağımlılıkları
conda_deps = CondaDependencies.create(pip_packages=[
    'pandas>=2.1.0',
    'scikit-learn>=1.3.0',
    'plotly>=5.15.0',
    'jupyterlab>=4.0.0'
])

# Ortam oluştur
env = Environment(name='nefret-sucu-analiz')
env.python.conda_dependencies = conda_deps
```

#### AWS SageMaker
```python
# SageMaker notebook instance yapılandırması
{
    "NotebookInstanceType": "ml.t3.xlarge",
    "RoleArn": "arn:aws:iam::account:role/SageMakerRole",
    "DefaultCodeRepository": "https://github.com/user/hate-crime-data-mining"
}
```

### Yerel Sunucu Dağıtımı
```bash
# Windows Görev Zamanlayıcısı için PowerShell betiği
# nefret-sucu-service.ps1

$env:PYTHONPATH = "C:\path\to\hate-crime-data-mining"
Set-Location "C:\path\to\hate-crime-data-mining"

# Sanal ortamı etkinleştir
& ".\nefret-sucu-env\Scripts\Activate.ps1"

# JupyterLab'ı başlat
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=notebooks
```

## 📝 Bakım ve Güncellemeler

### Bağımlılıkları Güncelleme
```bash
# Tüm paketleri güncelle
pip install --upgrade -r requirements.txt

# Belirli paketleri güncelle
pip install --upgrade pandas scikit-learn plotly jupyterlab

# Güvenlik açığı kontrolü
pip audit
bandit -r notebooks/
```

### Veri Güncellemeleri
```python
def validate_new_data_schema(df_new, df_reference):
    """Yeni veri formatını doğrula"""
    
    required_columns = df_reference.columns.tolist()
    missing_columns = set(required_columns) - set(df_new.columns)
    
    if missing_columns:
        raise ValueError(f"Eksik sütunlar: {missing_columns}")
    
    # Veri türü kontrolü
    for col in required_columns:
        if df_new[col].dtype != df_reference[col].dtype:
            print(f"Uyarı: {col} sütunu veri türü farklı")
    
    return True

# Kullanım örneği
# validate_new_data_schema(new_df, df)
```

## 🔒 Güvenlik Konuları

### Veri Gizliliği
- Veri kümelerinde kişisel tanımlayıcı bilgi (PII) olmadığından emin olun
- Tüm analizler için anonimleştirilmiş veri kullanın
- Hassas sonuçlar için erişim kontrolleri uygulayın

### Jupyter Güvenliği
```python
# Güvenli token oluştur
from jupyter_server.auth import passwd
passwd()  # Oluşturulan hash'i yapılandırmada kullanın
```

### Docker Güvenliği
```dockerfile
# Root olmayan kullanıcı olarak çalıştır
RUN useradd -m -s /bin/bash jupyter
USER jupyter

# Güvenlik güncellemeleri
RUN apt-get update && apt-get upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
```

## 📞 Destek ve Kaynaklar

### Yardım Alma
- **Dokümantasyon**: Proje genel bakışı için README.md'yi kontrol edin
- **Sorunlar**: Hata veya sorular için GitHub issue'ları oluşturun
- **Topluluk**: Geniş destek için veri bilimi topluluklarına katılın

### Ek Kaynaklar
- [Pandas Dokümantasyonu](https://pandas.pydata.org/docs/)
- [Scikit-learn Kullanıcı Kılavuzu](https://scikit-learn.org/stable/user_guide.html)
- [Plotly Dokümantasyonu](https://plotly.com/python/)
- [JupyterLab Dokümantasyonu](https://jupyterlab.readthedocs.io/)
- [Docker Dokümantasyonu](https://docs.docker.com/)

### Türkçe Kaynaklar
- **Veri Bilimi**: Python ile veri analizi ve makine öğrenmesi
- **İstatistik**: Temel istatistiksel kavramlar ve testler
- **Görselleştirme**: Etkili grafik tasarımı prensipleri

---

**Son Güncelleme**: Aralık 2024  
**Sürüm**: 2.0  
**Bakım**: Proje Ekibi  
**Dil**: Türkçe (Teknik terimler İngilizce korunmuştur)
