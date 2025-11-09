# Dockerfile
FROM python:3.10-slim

# 1. Installiere pip und uv separat, um Konflikte zu vermeiden
RUN pip install --no-cache-dir uv

# 2. Füge den Pfad für uv zur Umgebungsvariable PATH hinzu
# Dies stellt sicher, dass 'uv' in nachfolgenden Schritten gefunden wird.
ENV PATH="/usr/local/bin:$PATH"

# 3. Installiere die Anwendungsabhängigkeiten mit uv
# Verwende 'uv pip install' oder den Alias 'uv install' direkt
RUN uv install fastapi uvicorn

# Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# Anwendungscode kopieren
COPY main.py .

# Port
EXPOSE 8000

# Startbefehl
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

