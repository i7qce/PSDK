# Select from below depending on whether you need GPU access or not- may need to udpate cuda version depending on 
# GPU setup
FROM ubuntu
#FROM nvidia/cuda:11.7.0-runtime-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TERM xterm-256color

# Below from https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user

ARG USERNAME=i7qce
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

RUN yes | unminimize

RUN apt-get install -y ubuntu-standard

RUN apt-get update

RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y lilypond

RUN apt-get install -y php

RUN apt-get install -y libopencv-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python-is-python3

RUN pip install numpy scipy matplotlib jupyterlab pandas scikit-learn opencv-python ipympl pillow jupyter tqdm pytest
RUN pip install flask sqlalchemy flask-sqlalchemy flask-cors markdown lorem pymdown-extensions pygments mkdocs
RUN pip install music21
RUN pip install tensorflow

RUN apt-get install -y sqlite3

RUN apt-get install -y pandoc

RUN apt-get install -y texlive-full

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN git config --global user.name "i7qce"
RUN git config --global user.email "111165003+i7qce@users.noreply.github.com"

RUN ipython kernel install --user --name=dev_kernel

WORKDIR "/home/i7qce/docs"

# for pipenv
RUN pip install pipenv
RUN PATH=$PATH:/home/i7qce/.local/bin

# On Ubuntu Jammy lTS, need python 3.11 for some things:
# RUN apt-get install -y python3.11

CMD ["bash", "-l"]
