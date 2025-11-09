# Dockerfile
FROM python:3.10-slim

# Installiere uv und die Abhängigkeiten in einem Schritt
RUN pip install uv &&     uv install fastapi uvicorn

# Umgebungsvariable setzen
ENV PYTHONUNBUFFERED 1

# Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# Anwendungscode kopieren
COPY main.py .

# Port
EXPOSE 8000

# Startbefehl
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
