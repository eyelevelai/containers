#!/bin/bash

# Default flag value for pushing
push_flag=true
app=""

# Loop through all arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --no-push|-n)
      push_flag=false
      shift # Remove the flag from the argument list
      ;;
    *)
      app=$1
      shift # Remove the app name from the argument list
      ;;
  esac
done

# Check if the app variable is set
if [ -z "$app" ]; then
  echo "Error: No application name provided."
  echo "Usage: $0 [--no-push|-n] <app_name>"
  exit 1
fi

# Check if the directory exists
if [ ! -d "$app" ]; then
  echo "Error: Directory '$app' does not exist."
  exit 1
fi

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

docker buildx build --platform linux/amd64,linux/arm64 -t public.ecr.aws/c9r4x6y5/eyelevel/$app:latest $app

# Log in to AWS ECR and push if push_flag is true
if [ "$push_flag" = true ]; then
  docker push public.ecr.aws/c9r4x6y5/eyelevel/$app:latest
fi