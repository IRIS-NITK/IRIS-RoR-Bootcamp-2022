# Dev Containers
The [Visual Studio Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
extension lets you use a Docker container as a full-featured development environment.

Steps to [install](https://code.visualstudio.com/docs/devcontainers/containers#_installation)
and use dev Containers - 

## 1. Install docker
**Windows / macOs**
* If you are using windows, ensure [WSL 2](https://aka.ms/vscode-remote/containers/docker-wsl2) 
back-end is enabled. Steps to install WSL2 - 
[https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

* Install [Docker Desktop for Windows/Mac](https://www.docker.com/products/docker-desktop).

**Linux**
* Install [docker](https://docs.docker.com/desktop/install/linux-install/)

## 2. Install Visual Studio Code
* Download and install [vscode](https://code.visualstudio.com/)
* Install [Dev Container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension for vscode.

--------------------------------------------------

**Clone the repo and open it in vscode**
```bash
git clone https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022
cd IRIS-RoR-Bootcamp-2022
code .
```
## 3. Open the folder in dev container
* Click on quick actions Status bar item, and from the dropdown select **Reopen in Container**. This uses the dev container [config file](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/blob/install-ror/.devcontainer/devcontainer.json) inside `.devcontainer` folder to create a new dev container.
<img width="960" alt="r" src="https://user-images.githubusercontent.com/66632353/208943230-bc1fc5c4-a8fe-4b05-9ad6-2c65ae32a2b4.png">

* The VS Code window will reload and start building the dev container. A progress notification provides status updates.
* After the build completes, VS Code will automatically connect to the container.

-------------------------------------------------

The folder will be reopened inside a Debian container.
The container has `rvm`, `node` and `yarn` preinstalled so you can get started off working with rails.

![image](https://user-images.githubusercontent.com/66632353/208944762-9279ad6f-7408-480c-9c10-fd0296137f8a.png)

--------------------------------------------------

Once done head over [here](./README.md#rvm), to learn about RVM and gemsets.