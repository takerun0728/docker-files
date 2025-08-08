alias ndoc_run="docker run --gpus all \
-it \
--net=host \
--cap-add=SYS_PTRACE \
--privileged \
-v /run/user:/run/user \
-v $HOME/vscode_remote:/home/ubuntu/.vscode-server \
-v $HOME/.gitconfig:/home/ubuntu/.gitconfig \
-v $HOME/docker_share:/home/ubuntu/share \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-e NVIDIA_DRIVER_CAPABILITIES=all"

alias wsldoc_run="docker run \
-it \
--net=host \
--cap-add=SYS_PTRACE \
--privileged \
--device=/dev/dxg:/dev/dxg \
-v /run/user:/run/user \
-v $HOME/vscode_remote:/home/ubuntu/.vscode-server \
-v $HOME/.gitconfig:/home/ubuntu/.gitconfig \
-v $HOME/docker_share:/home/ubuntu/share \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
-e DISPLAY=$DISPLAY \
-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
-e XDG_RUNTIME=$XDG_RUNTIME \
-e PULSE_SERVER=$PULSE_SERVER \
-e LD_LIBRARY_PATH=/usr/lib/wsl/lib"

alias wslndoc_run="docker run --gpus all \
-it \
--net=host \
--cap-add=SYS_PTRACE \
--privileged \
--device=/dev/dxg:/dev/dxg \
-v /run/user:/run/user \
-v $HOME/vscode_remote:/home/ubuntu/.vscode-server \
-v $HOME/.gitconfig:/home/ubuntu/.gitconfig \
-v $HOME/docker_share:/home/ubuntu/share \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
-e DISPLAY=$DISPLAY \
-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
-e XDG_RUNTIME=$XDG_RUNTIME \
-e PULSE_SERVER=$PULSE_SERVER \
-e LD_LIBRARY_PATH=/usr/lib/wsl/lib"

alias doc_exec="docker exec -it"
