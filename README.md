# containers

Builds containers and pushes them to EyeLevel.ai public ECR public repositories.

```
./build.sh {FOLDER_NAME} (optional for build only) -n
```

If -n or --no-push is added to the build command, the Docker container will be built but not pushed.

Run the following command to debug the containers locally:

```
docker run --platform linux/amd64 -it public.ecr.aws/c9r4x6y5/eyelevel/{FOLDER_NAME}:latest /bin/bash
```