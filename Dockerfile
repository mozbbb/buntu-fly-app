# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# Non-interaktif agar tidak ada prompt selama build
ENV DEBIAN_FRONTEND=noninteractive

# Update & install basic packages
RUN apt update && apt install -y \
    curl wget git sudo nano unzip ca-certificates \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Tambahkan user non-root untuk keamanan
RUN useradd -m appuser && echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER appuser
WORKDIR /home/appuser

# Copy script startup ke container
COPY start.sh /home/appuser/start.sh
RUN chmod +x /home/appuser/start.sh

# Port yang akan digunakan
EXPOSE 8080

# Jalankan script saat container start
CMD ["/home/appuser/start.sh"]
