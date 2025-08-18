#!/bin/zsh

curl -LsSf https://astral.sh/uv/install.sh | sh

brew install pyenv
pyenv install 3.11.8
pyenv global 3.11.8

# ~/.zhsrc 에 복붙
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# 후 
# source ~/.zshrc

uv venv mcp-test

source mcp-test/bin/activate
uv pip install mcp
