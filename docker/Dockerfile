# For this to work, please ensure the terminal is inside the PSDK/docker/ directory when running
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

# Copy all env files into the container
COPY env_files/ /opt/env_files

# Install all system level packages
RUN xargs sudo apt-get install -y /opt/env_files/reqs_system.txt

# Install all python packages
RUN pip install -r /opt/env_files/reqs_python.txt



# music21 searches for an executable called /usr/bin/mscore3, so create a symlink which points at /usr/bin/mscore which is installed in above command
RUN ln -s /usr/bin/mscore /usr/bin/mscore3
# for pipenv
RUN PATH=$PATH:/home/i7qce/.local/bin
# Setup dev_kernel
RUN ipython kernel install --user --name=dev_kernel

# IF CPU:
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

# IF GPU:


# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Configure git
RUN git config --global user.name "i7qce"
RUN git config --global user.email "111165003+i7qce@users.noreply.github.com"

WORKDIR "/home/i7qce/docs"

CMD ["bash", "-l"]
