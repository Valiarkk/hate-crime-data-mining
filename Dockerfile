# ===================================================================
# NEFRET SUÇU DATA MINING DOCKER CONTAINER
# ===================================================================
# Modern Python 3.11 tabanlı optimized container
# Tüm data mining kütüphaneleri ve Jupyter environment ile

# Python 3.11 ile optimize edilmiş base image
FROM python:3.11-slim

# Container metadata
LABEL maintainer="Hate Crime Data Mining Project"
LABEL version="2.0"
LABEL description="Comprehensive data mining environment for hate crime analysis"

# Environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV JUPYTER_ENABLE_LAB=yes

# System dependencies ve build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gfortran \
    libatlas-base-dev \
    liblapack-dev \
    libblas-dev \
    libffi-dev \
    libssl-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /app

# Python package installation optimization
RUN pip install --upgrade pip setuptools wheel

# Copy requirements ve install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Jupyter configuration
RUN jupyter lab --generate-config
RUN echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py
RUN echo "c.ServerApp.allow_root = True" >> ~/.jupyter/jupyter_lab_config.py
RUN echo "c.ServerApp.open_browser = False" >> ~/.jupyter/jupyter_lab_config.py

# Project dosyalarını copy et
COPY . .

# Data directory oluştur
RUN mkdir -p /app/data /app/output /app/logs

# Permissions
RUN chmod -R 755 /app

# Port exposure
EXPOSE 8888 8889

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8888/lab || exit 1

# Volume mounts (data persistence için)
VOLUME ["/app/data", "/app/output", "/app/logs"]

# Default command - JupyterLab
CMD ["jupyter", "lab", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--allow-root", \
     "--no-browser", \
     "--notebook-dir=/app", \
     "--ServerApp.token=''", \
     "--ServerApp.password=''", \
     "--ServerApp.allow_origin='*'", \
     "--ServerApp.disable_check_xsrf=True"]

