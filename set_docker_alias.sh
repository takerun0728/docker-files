alias ndoc_run="docker run --runtime=nvidia \
-it \
--net=host \
--cap-add=SYS_PTRACE \
--privileged \
-v /run/user:/run/user \
-v $HOME/vscode_remote:/home/docker/.vscode-server \
-v $HOME/.gitconfig:/home/docker/.gitconfig \
-v $HOME/projects:/home/docker/projects \
-v $HOME/bags:/home/docker/bags \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-e NVIDIA_DRIVER_CAPABILITIES=all"

alias wsldoc_run="docker run --runtime=nvidia \
-it \
--net=host \
--cap-add=SYS_PTRACE \
--privileged \
--device=/dev/dxg:/dev/dxg \
-v /run/user:/run/user \
-v $HOME/vscode_remote:/home/docker/.vscode-server \
-v $HOME/.gitconfig:/home/docker/.gitconfig \
-v $HOME/projects:/home/docker/projects \
-v $HOME/bags:/home/docker/bags \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
-v /usr/lib/wsl:/usr/lib/wsl \
-e DISPLAY=$DISPLAY \
-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
-e XDG_RUNTIME=$XDG_RUNTIME \
-e PULSE_SERVER=$PULSE_SERVER \
-e LD_LIBRARY_PATH=/usr/lib/wsl/lib"

alias doc_exec="docker exec -it"
