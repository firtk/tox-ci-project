.PHONY: ci-install-pythons install-pyenv install test setup-pyenv-local setup-ubuntu-for-pyenv

setup-ubuntu-for-pyenv:
	sudo apt-get update
	sudo apt-get install make build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
		libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev


install-pythons:
	pyenv install 3.6.15
	pyenv install 3.7.13
	pyenv install 3.8.13
	pyenv install 3.9.12
	# pyenv install 3.10.4
	pyenv local 3.6.15 3.7.13 3.8.13 3.9.12 3.10.4

setup-pyenv-local:
	.pyenv/bin/pyenv global system 3.6.15 3.10.4

test:
	venv/bin/tox
