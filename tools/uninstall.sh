read -r -p "Are you sure you want to remove Oh My Zsh? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Uninstall cancelled"
  exit
fi

echo "Removing ~/.oh-my-shit"
if [ -d ~/.oh-my-shit ]; then
  rm -rf ~/.oh-my-shit
fi

if [ -e ~/.zshrc ]; then
  ZSHRC_SAVE=~/.zshrc.omz-uninstalled-$(date +%Y-%m-%d_%H-%M-%S)
  echo "Found ~/.zshrc -- Renaming to ${ZSHRC_SAVE}"
  mv ~/.zshrc "${ZSHRC_SAVE}"
fi

echo "Looking for original zsh config..."
ZSHRC_ORIG=~/.zshrc.pre-oh-my-shit
if [ -e "$ZSHRC_ORIG" ]; then
  echo "Found $ZSHRC_ORIG -- Restoring to ~/.zshrc"
  mv "$ZSHRC_ORIG" ~/.zshrc
  echo "Your original zsh config was restored."
else
  echo "No original zsh config found"
fi

if hash chsh >/dev/null 2>&1 && [ -f ~/.shell.pre-oh-my-shit ]; then
  old_shell=$(cat ~/.shell.pre-oh-my-shit)
  echo "Switching your shell back to '$old_shell':"
  if chsh -s "$old_shell"; then
    rm -f ~/.shell.pre-oh-my-shit
  else
    echo "Could not change default shell. Change it manually by running chsh"
    echo "or editing the /etc/passwd file."
  fi
fi

echo "Thanks for trying out Oh My Zsh. It's been uninstalled."
echo "Don't forget to restart your terminal!"
