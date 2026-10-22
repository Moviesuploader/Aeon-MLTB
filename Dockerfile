FROM 5hojib/aeon:latest

WORKDIR /app
RUN chmod 777 /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3.13-venv python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv .venv

COPY requirements.txt .
RUN .venv/bin/python -m pip install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]
