#!/bin/bash
echo "=== Ubuntu 22.04 on Fly.io ==="
echo "Date: $(date)"
echo "User: $(whoami)"
echo "Working directory: $(pwd)"
echo "Running simple HTTP server on port 8080"

# Jalankan server sederhana
python3 -m http.server 8080
