.PHONY: ci-install-pythons install-pyenv install test setup-pyenv-local:

install-pyenv:
	curl https://pyenv.run | PYENV_ROOT=./.pyenv bash || echo '-- pyenv already setup, skipping --\n'
	PYENV_ROOT=./.pyenv ./.pyenv/bin/pyenv install -s 3.6.15
	PYENV_ROOT=./.pyenv ./.pyenv/bin/pyenv install -s 3.10.4

setup-pyenv-local:
	pyenv local 3.6.15 3.10.4

test:
	tox
