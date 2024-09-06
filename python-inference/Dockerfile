FROM nvidia/cuda:12.6.0-cudnn-runtime-ubuntu20.04

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y python3 pip vim curl
RUN ln -s /usr/bin/python3 /usr/bin/python

# Download the necessary tiktoken files and cache them in the image
RUN mkdir -p /app/tiktoken_cache && \
    curl -o /app/tiktoken_cache/vocab.bpe https://openaipublic.blob.core.windows.net/gpt-2/encodings/main/vocab.bpe && \
    curl -o /app/tiktoken_cache/encoder.json https://openaipublic.blob.core.windows.net/gpt-2/encodings/main/encoder.json

COPY requirements.search.inference.txt /app/requirements.txt

RUN mkdir -p /app/hf_models_cache

# Create a group with GID 1001
RUN groupadd -g 1001 python

# Create a user with UID 1001 and associate it with GID 1001
RUN useradd -u 1001 -g python -m -s /bin/bash python

# Set permissions to ensure OpenShift compatibility
RUN chmod -R g+rwX /app && chown -R 1001:1001 /app

USER 1001

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV HF_HOME=/app/hf_models_cache
ENV LOCAL=0
ENV LOAD_MODEL=1
ENV HOME="/home/python"
ENV PATH="${HOME}/.local/bin:${PATH}"
ENV TIKTOKEN_CACHE_DIR=/app/tiktoken_cache

# Install the required Python packages
RUN pip install --default-timeout=600 -r requirements.txt
RUN pip install --upgrade typing_extensions