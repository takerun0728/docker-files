docker build --build-arg BASE_IMAGE=nvidia/cuda:12.8.0-devel-ubuntu24.04 --build-arg ENBL_GPU=yes -t quantum:gpu .
