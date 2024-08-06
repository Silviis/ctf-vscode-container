# ctf-vscode-container

## Requirements
To use this repo, you have to have Docker and vscode installed, as well as the "Remote Development" extension for it.

## Usage
Clone this repository and open it in vscode. From the bottom left corner press the "Open a remote window" -button, and from the opening dialog window press "Reopen in Container". More info about vscode dev containers can be found from the following link: [https://code.visualstudio.com/docs/devcontainers/containers](https://code.visualstudio.com/docs/devcontainers/containers)

## More info
In order to get the GUI applications to work in your host system, you have to allow the xserver usage of your user by running:
```
xhost +SI:localuser:$(id -un)
```
Note that the Dockerfile assumes that your UID is 1000. If your host systems user has some other UID, please edit the Dockerfile according to your needs.

All of the files and folder under the root directory of this repository are shared to the container environment.

This container is tested only in Linux environment running Wayland. Running this inside Windows (or WSL) should be possible, but might require tinkering with X server forwarding.
