# Simple Python App Docker Container

This is a simple docker container that will load a python app from a git repo 
inside the container. Once the git repo is loaded it will run the python app.

## Usage

```
docker create \
  --name=TutorialBot \
  -e PYTHONAPP_MODE=<APP\WSGI>
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

-e PYTHONAPP_MODE

Sets the app mode, APP runs a python file, WSGI mode runs a WSGI object within
a python file. In WSGI mode the WSGI app will be served on port 8000.

You can not change this from APP to WSGI after initial install, the WSGI server
will not be installed.

-e PYTHONAPP_GIT_HTTPS

Sets the git repo to clone, no default

-e PYTHONAPP_LOCATION

Sets the location to store the pythonapp, default: /opt/pythonapp/

-e PYTHONAPP

Sets the python app to run, in APP mod this will be a full file name; 
in WSGI mode this will be the file name (without extension) followed by the 
WSGI app object, using the following format, file:app.  

-e PYTHONAPP_NAME

Sets the python app name, no default

-e PYTHONAPP_AUTHKEY

During setup, the container creates a file called auth.py in the apps root
directory. It will then create a variable called token and assigns 
PYTHONAPP_AUTHKEY value to that variable.

-e PYTHONAPP_PACKAGES

A space separated list of python packages to install

##  Example

App Mode:
```bash
docker create \
  --name=TutorialBot \
  -e PYTHONAPP_MODE=APP
  -e PYTHONAPP_GIT_HTTPS="https://github.com/krovikan666/TutorialBot.git" \
  -e PYTHONAPP_NAME=TutorialBot \
  -e PYTHONAPP=bot.py \
  -e PYTHONAPP_AUTHKEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" \
  -e PYTHONAPP_PACKAGES="docker discord" \
  bf9cf2c37887
```  

WSGI Mode:
```bash
docker create \
  --name=FalconDemo \
  -e PYTHONAPP_MODE=WSGI \
  -e PYTHONAPP_GIT_HTTPS="https://github.com/krovikan666/FalconDemo.git" \
  -e PYTHONAPP_NAME=FalconDemo \
  -e PYTHONAPP="webapp:app" \
  -e PYTHONAPP_PACKAGES="docker falcon mako" \
  -p 8000:8000 \
  bad0a6d6c0b0
```