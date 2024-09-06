FROM nvidia/cuda:12.6.0-cudnn-runtime-ubuntu20.04

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y python3 pip vim curl
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN mkdir -p /app/hf_models_cache

# Create a group with GID 1001
RUN groupadd -g 1001 python

# Create a user with UID 1001 and associate it with GID 1001
RUN useradd -u 1001 -g 1001 -m -s /bin/bash python

# Set permissions to ensure OpenShift compatibility
RUN chmod -R 1777 /app && chown -R 1001:1001 /app

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
RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir tensorflow
RUN pip install --no-cache-dir transformers
RUN pip install --no-cache-dir torch
RUN pip install --no-cache-dir bitsandbytes
RUN pip install --no-cache-dir accelerate
RUN pip install --no-cache-dir optimum[onnxruntime-gpu]
RUN pip install --no-cache-dir celery
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir pydantic

RUN pip install --no-cache-dir --upgrade typing_extensions