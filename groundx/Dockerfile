# Start with the EyeLevel Golang image
FROM public.ecr.aws/c9r4x6y5/eyelevel/golang:latest

# Set the default user back to the OpenShift random UID
USER root

# Set the working directory inside the container
WORKDIR /app

# Copy the service file and binary into the container
#COPY your-binary /usr/local/bin/your-binary
COPY acls.json /app/acls.json
COPY bootstrap /app/bootstrap

# Set permissions to ensure OpenShift compatibility
RUN chmod -R g+rwX /app && chown -R 1000:1000 /app

EXPOSE 8080

USER 1000

CMD ["/app/bootstrap"]