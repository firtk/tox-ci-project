FROM ubuntu:20.04

ENV TZ=America/New_York \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

RUN apt-get install -y git

RUN unset PYENV_ROOT
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# RUN cd ~/.pyenv && src/configure && make -C src
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
RUN echo 'eval "$(pyenv init -)"' >> ~/.profile
SHELL ["/bin/bash", "-c"] 
RUN source ~/.bashrc
RUN pyenv install 3.10.3
RUN pyenv global 3.10.3
RUN python3.10
