# Script to create a docker container from a docker image.
#
# USAGE: ./create_container.sh
#

echo "Creating a new docker image from the Dockerfile in this directory"

read -p "Enter the name of the image to use: " image_name
read -p "Enter the name of the new container: " container_name

echo "Creating $container_name from $image_name""..."

#docker run -it -v <volume name>:<path to mount> <image name>
docker run -it --name $container_name -v v1:/home/i7qce/docs/ $image_name