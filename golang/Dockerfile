# Start with the official Red Hat Redis image
FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Create a group with GID 1001
RUN groupadd -g 1001 golang

# Create a user with UID 1001 and associate it with GID 1001
RUN useradd -u 1001 -g 1001 -m -s /bin/bash golang

# Set permissions to ensure OpenShift compatibility
RUN chmod -R 777 /app && chown -R 1001:1001 /app

# Set the default user back to golang
USER 1001

ENV HOME=/home/golang

RUN mkdir -p ~/.cashbot && chmod -R 777 ~/.cashbot