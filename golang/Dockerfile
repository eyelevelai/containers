# Start with the official Red Hat Redis image
FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Create a group with GID 1000
RUN groupadd -g 1000 golang

# Create a user with UID 1000 and associate it with GID 1000
RUN useradd -u 1000 -g golang -m -s /bin/bash golang

# Set permissions to ensure OpenShift compatibility
RUN chmod -R g+rwX /app && chown -R 1000:1000 /app

# Set the default user back to golang
USER 1000

ENV HOME=/home/golang

RUN mkdir -p ~/.cashbot && chmod -R g+rwX ~/.cashbot