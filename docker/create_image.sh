# Script to build a docker image from docker file in CWD. Will prompt you for the name of the new image.
#
# USAGE: ./create_image.sh
#

echo "Creating a new docker image from the Dockerfile in this directory"

read -p "Enter the name of the new image: " image_name

echo "Creating $image_name""..."

docker build -t $image_name .