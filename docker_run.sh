
DOCKER_IMAGE="docker-im"
CONTAINER_NAME="docker-ct"
WORK_DIR="/$DOCKER_IMAGE" 

DATASET_PATH="`pwd`/../datasets"
PORT=8888:8888

if [ -z $1 ]
then
	echo "Loading default: $DOCKER_IMAGE"
else
	DOCKER_IMAGE=$1
	echo "Image: '$DOCKER_IMAGE'."
fi

if [ -z $2 ]
then
	echo "Default container: $CONTAINER_NAME."
else
	CONTAINER_NAME=$2
	echo "Container: $CONTAINER_NAME."
fi

if [ -z $3 ]
then
	WORK_DIR="/$DOCKER_IMAGE"
else
	WORK_DIR=$3
fi
echo "Working directory: $WORK_DIR."



echo "Image:$DOCKER_IMAGE | Container:$CONTAINER_NAME | WORK_DIR:$DOCKER_IMAGE"
echo "Including volume: $DATASET_PATH"
echo "Using Port: $PORT"

sudo docker run -it -p $PORT --user root --rm --gpus all \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --gpus all \
    --shm-size 8G \
    --workdir=$WORK_DIR \
    --name=$CONTAINER_NAME \
    --privileged \
    --oom-kill-disable \
    --volume="`pwd`:$WORK_DIR" \
    --volume="$DATASET_PATH:$WORK_DIR/../datasets:ro" \
    --volume="/usr/local/cuda/bin:/usr/local/cuda/bin:ro" \
    --volume="/usr/local/cuda/lib64:/usr/local/cuda/lib64:ro" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    $DOCKER_IMAGE

exit $?
