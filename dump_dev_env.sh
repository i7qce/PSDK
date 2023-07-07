# This script will dump the contents of a docker volume attached to a container into the host at a specified location
# Also, will copy this file from the host into the volume 
#
#
# USAGE: ./dump_dev_env.sh 52845024985 path/to/repo (no trailing slash)
#
#

# Get current dir this script is run from as host_target_dir
host_target_dir=$(pwd)

# Get container id
container_id=$1
container_target_dir=$2


echo "Using docker container $container_id"
echo "Using target directory on host $host_target_dir"
echo "Using target directory on container $container_target_dir"
echo ""

# Copy everything from container into target dir
echo "Copying $container_id:$container_target_dir into $host_target_dir"
docker cp $container_id:$container_target_dir $host_target_dir/

# Also, copy this file into an appropriate location in the container (since this is always
# run from the host, so we can avoid having to manually copy over any changes)
echo "Copying $host_target_dir/dump_dev_env.sh to $container_id:$container_target_dir/dump_dev_env.sh"
docker cp $host_target_dir/dump_dev_env.sh $container_id:$container_target_dir/dump_dev_env.sh

# Also, copy the dockerfile + scripts to build image and run container into outer directory
#echo "Copying Dockerfile, create_image.sh, and create_container.sh from inside $host_target_dir/$(basename $container_target_dir)/docker to $host_target_dir"
#cp $host_target_dir/$(basename $container_target_dir)/docker/Dockerfile $host_target_dir/Dockerfile
#cp $host_target_dir/$(basename $container_target_dir)/docker/create_image.sh $host_target_dir/create_image.sh
#cp $host_target_dir/$(basename $container_target_dir)/docker/create_container.sh $host_target_dir/create_container.sh

# chmod scripts so they can run
#chmod u+x $host_target_dir/create_image.sh
#chmod u+x $host_target_dir/create_container.sh
