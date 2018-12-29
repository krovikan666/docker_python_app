# Simple Python App Docker Container

This is a simple docker container that will load a python app from a git repo 
inside the container. Once the git repo is loaded it will run the python app.

## Usage

```
docker create \
  --name=TutorialBot \
  -e PYTHONAPP_GIT_HTTPS=<GIT repo> \
  -e PYTHONAPP_NAME=<App name> \
  -e PYTHONAPP_FILE=<App main> \
  -e PYTHONAPP_PACKAGES=<List of Python Packages> \
  <image id>
```
 
## Parameters

-e UBUNTU_REPOSITORY

Adds an apt repository to the container, default: 
ppa:jonathonf/python-3.6 

-e UBUNTU_PYTHON

Sets the python package to use. default: python3.6

-e UBUNTU_PIP

Sets the python pip package to use, default: python3-pip

-e PYTHONAPP_GIT_HTTPS

Sets the git repo to clone, no default

-e PYTHONAPP_LOCATION

Sets the location to store the pythonapp, default: /opt/pythonapp/

-e PYTHONAPP_NAME

Sets the python app name, no default

-e PYTHONAPP_FILE

Sets the python file to run, no default

-e PYTHONAPP_AUTHKEY

During setup, the container creates a file called auth.py in the apps root
directory. It will then create a variable called token and assigns 
PYTHONAPP_AUTHKEY value to that variable.

-e PYTHONAPP_PACKAGES

A space separated list of python packages to install

##  Example

```
docker create \
  --name=TutorialBot \
  -e PYTHONAPP_GIT_HTTPS="https://github.com/krovikan666/TutorialBot.git" \
  -e PYTHONAPP_NAME=TutorialBot \
  -e PYTHONAPP_FILE=bot.py \
  -e PYTHONAPP_AUTHKEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" \
  -e PYTHONAPP_PACKAGES="docker discord" \
  bf9cf2c37887
```  