#!/bin/bash

ZSHRC=~/.zshrc
DIRTY_BIT="#PYENV SETUP"

if ! grep -q "$DIRTY_BIT" "$ZSHRC"; then
  echo "$DIRTY_BIT" >> "$ZSHRC"
  cat << EOF >> "$ZSHRC"

export PATH=\$PATH:~/.local/bin

export PYENV_ROOT="\$HOME/.pyenv"
[[ -d \$PYENV_ROOT/bin ]] && export PATH="\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"

eval "\$(pyenv virtualenv-init -)"
EOF
		echo "Pyenv setup added to $ZSHRC"
else
		echo "Pyenv setup already exists in $ZSHRC"
fi
