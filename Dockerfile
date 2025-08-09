FROM python:3.8 AS builder

USER appuser

WORKDIR /app

RUN sudo apt-get update && \
    sudo apt-get install -y -no-install-recommends gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

# ---------------- FINAL STAGE ------------------------
FROM python:3.8-slim AS runner

USER appuser

WORKDIR /app

RUN sudo apt-get update && \
    sudo apt-get install -y -no-install-recommends gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

COPY --from=buildStep /usr/local/lib/python3.11-slim-bookworm/site-packages/ /usr/local/lib/python3.11-slim-bookworm/site-packages/

EXPOSE 5000

ENTRYPOINT ["python","app.py"]



