FROM python:3.11-slim

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y vim procps curl

# Download the necessary tiktoken files and cache them in the image
RUN mkdir -p /app/tiktoken_cache
COPY 6c7ea1a7e38e3a7f062df639a5b80947f075ffe6 /app/tiktoken_cache/
COPY 6d1cbeee0f20b3d9449abfede4726ed8212e3aee /app/tiktoken_cache/

COPY requirements.search.api.txt /app/requirements.txt

# Create a group with GID 1001
RUN groupadd -g 1001 python

# Create a user with UID 1001 and associate it with GID 1001
RUN useradd -u 1001 -g python -m -s /bin/bash python

# Set permissions to ensure OpenShift compatibility
RUN chmod -R g+rwX /app && chown -R 1001:1001 /app

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV HF_HOME=/app/hf_models_cache
ENV LOCAL=0
ENV HOME="/home/python"
ENV PATH="${HOME}/.local/bin:${PATH}"
ENV TIKTOKEN_CACHE_DIR=/app/tiktoken_cache

USER 1001

RUN pip install --upgrade pip
RUN python -m pip install -r requirements.txt
