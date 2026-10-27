FROM 5hojib/aeon:latest

WORKDIR /app
RUN chmod 777 /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl python3.13-venv python3-pip \
    && curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh \
    && /usr/local/bin/deno --version \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/bin:${PATH}"

RUN python3 -m venv .venv

COPY requirements.txt .
RUN .venv/bin/python -m pip install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]
