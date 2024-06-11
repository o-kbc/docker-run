
IMAGE_NAME="docker-im"
IMAGE_FILE="dockerfiles/docker.dockerfile"

echo $(pwd)

if [ -z $1 ]
then
	echo "Building image '$IMAGE_NAME'."
else
	IMAGE_NAME=$1
	echo "Building image '$IMAGE_NAME'."
fi

if [ -z $2 ]
then
	echo "From file '$IMAGE_FILE'."
else
	IMAGE_FILE=$2
	echo "From file '$IMAGE_FILE'."
fi

echo $(pwd)
docker build -f $IMAGE_FILE -t $IMAGE_NAME $(pwd)/../