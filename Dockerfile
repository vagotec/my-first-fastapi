# Dockerfile
# Basis-Image: Schlanker Python-Build
FROM python:3.10-slim

# 1. Installiere den Paketmanager 'uv' separat mit pip
# Der Fehler 'exit code 2' kommt oft daher, dass uv nicht im Pfad gefunden wird.
RUN pip install --no-cache-dir uv

# 2. Umgebungsvariable PATH (Optional, aber robust)
# Stellt sicher, dass 'uv' in nachfolgenden Schritten gefunden wird.
ENV PATH="/usr/local/bin:$PATH"
ENV PYTHONUNBUFFERED 1

# 3. Installiere die Anwendungsabhängigkeiten (FastAPI, Uvicorn) mit uv
# Dies ersetzt die fehlgeschlagene RUN-Zeile.
RUN uv pip install fastapi uvicorn

# Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# Anwendungscode kopieren
COPY main.py .

# Port
EXPOSE 8000

# Startbefehl
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
