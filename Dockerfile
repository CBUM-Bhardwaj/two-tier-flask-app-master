FROM python:3.9-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
        gcc \
        libmysqlclient-dev \
        default-libmysqlclient-dev \
        pkg-config \
        python3-dev \
        build-essential \
        libssl-dev \
        libffi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
