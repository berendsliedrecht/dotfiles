source ~/.config/zsh/alias.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/path.zsh
source ~/.config/zsh/options.zsh
source ~/.config/zsh/autocomplete.zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source ~/.config/zsh/variables.linux.zsh
elif [[ "$OSTYPE" == "darwin" ]]; then
  source ~/.config/zsh/variables.macos.zsh
fi
