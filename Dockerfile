# Dockerfile
# Basis-Image: Schlanker Python-Build
FROM python:3.10-slim

# 1. Installiere den Paketmanager 'uv'
RUN pip install --no-cache-dir uv

# 2. Optionale, aber sinnvolle Umgebungsvariablen
ENV PATH="/usr/local/bin:$PATH"
ENV PYTHONUNBUFFERED=1

# 3. Installiere FastAPI + Uvicorn ins System (nicht in venv!)
RUN uv pip install --system fastapi uvicorn

# 4. Arbeitsverzeichnis
WORKDIR /app

# 5. Anwendungscode kopieren
COPY main.py .

# 6. Port öffnen
EXPOSE 8000

# 7. Startbefehl
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

