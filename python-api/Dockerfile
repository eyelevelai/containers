FROM python:3.11-slim

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y vim procps

COPY requirements.search.api.txt /app/requirements.txt

# Create a group with GID 1001
RUN groupadd -g 1001 python

# Create a user with UID 1001 and associate it with GID 1001
RUN useradd -u 1001 -g python -m -s /bin/bash python

# Set permissions to ensure OpenShift compatibility
RUN chmod -R g+rwX /app && chown -R 1001:1001 /app

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV TRANSFORMERS_CACHE=/app/hf_models_cache
ENV LOCAL=0
ENV PATH="/home/python/.local/bin:${PATH}"

USER 1001

RUN pip install --upgrade pip
RUN python -m pip install -r requirements.txt
