FROM ubuntu
MAINTAINER Clifford Dutka

# set global envrionment settings
ENV \
  UBUNTU_REPOSITORY="ppa:jonathonf/python-3.6" \
  UBUNTU_PYTHON="python3.6" \
  UBUNTU_PIP="python3-pip"  \
  PYTHONAPP_MODE="APP" \
  PYTHONAPP_GIT_HTTPS="" \
  PYTHONAPP_LOCATION="/opt/pythonapp/" \
  PYTHONAPP="" \
  PYTHONAPP_NAME="" \
  PYTHONAPP_AUTHKEY="" \
  PYTHONAPP_PACKAGES=""

# install python 3.6
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ${UBUNTU_REPOSITORY} && \
  apt-get update && \
  apt-get install -y ${UBUNTU_PYTHON}

RUN apt-get install -y ${UBUNTU_PIP}
RUN apt-get install -y git

# Copy root directory
COPY root/ /

# Setting entry point script
RUN ["chmod", "+x", "/opt/appsetup/run"]
ENTRYPOINT ["/opt/appsetup/run"]
