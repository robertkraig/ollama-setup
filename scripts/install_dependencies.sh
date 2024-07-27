#!/bin/bash

# Check if pyenv is installed
if ! pyenv --version >/dev/null 2>&1; then
    echo "pyenv is not installed. Installing pyenv..."
    curl https://pyenv.run | bash
else
    echo "pyenv is already installed."
fi

# Check if poetry is installed
if ! poetry --version >/dev/null 2>&1; then
    echo "Poetry is not installed. Installing Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
else
    echo "Poetry is already installed."
fi
