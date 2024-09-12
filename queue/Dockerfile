# QueueTrainFile Lambda

# Start with the EyeLevel Golang image
FROM public.ecr.aws/c9r4x6y5/eyelevel/golang:latest

# Set the default user back to the OpenShift random UID
USER root

# Set the working directory inside the container
WORKDIR /app

# Copy the service file and binary into the container
COPY bootstrap /app/

# Set permissions to ensure OpenShift compatibility
RUN chmod -R 777 /app && chown -R 1001:1001 /app

EXPOSE 8080

USER 1001

CMD ["/app/bootstrap"]