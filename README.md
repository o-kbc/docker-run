# docker-run
Create docker environment and run

### Install Docker and Nvidia Toolkit

```
$ ./scripts/install_docker.sh
$ ./scripts/install_nvidia_container_toolkit.sh
```

### Dockerfile

Include dockerfiles in ./dockerfiles/


### Build

```
$ ./docker_build.sh [IMAGE_NAME] [DOCKER_FILE]
```

### Run

```
$ ./docker_run.sh [IMAGE_NAME] [CONTAINER_NAME]
```


### Additional info

1. Adjust dataset volume or port value in docker_run.sh
2. Set dir to copy in [DOCKER_FILE]
3. Keep dockerfiles in dockerfiles/