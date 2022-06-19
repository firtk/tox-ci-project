.PHONY: ci-install-pythons install-pyenv install test setup-pyenv-local

setup-ubuntu:
	sudo apt-get update
	sudo apt-get install make build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
		libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev


install-pyenv:
	curl https://pyenv.run | PYENV_ROOT=./.pyenv bash || echo '-- pyenv already setup, skipping --\n'
	PYENV_ROOT=./.pyenv ./.pyenv/bin/pyenv install -s 3.6.15
	PYENV_ROOT=./.pyenv ./.pyenv/bin/pyenv install -s 3.10.4
	exec $SHELL

setup-pyenv-local:
	pyenv local 3.6.15 3.10.4

test:
	tox
