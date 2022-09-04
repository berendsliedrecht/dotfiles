DEV="$HOME/Developer"
CONFIG="$HOME/.config"
TMP="$DEV/tmp"
WORK="$DEV/work"
PERSONAL="$DEV/personal"
ANIMO="$WORK/animo"
HYPERLEDGER="$WORK/hyperledger"
ESSIF="$WORK/essif"
IDCRYPT="$WORK/idcrypt"
NOTEBOOK="$HOME/Notebook"

# Directories
alias tmp="cd $TMP"
alias work="cd $WORK"
alias per="cd $PERSONAL"
alias animo="cd $ANIMO"
alias hype="cd $HYPERLEDGER"
alias esf="cd $ESSIF"
alias conf="cd $CONFIG"
alias idc="cd $IDCRYPT"
alias notes="cd $NOTEBOOK"

# Editting
alias v="vim"
alias nv="nvim"
alias c="codium ."
alias als="vim ~/.config/zsh/alias.zsh"

# Sourcing
alias szsh="source ~/.zshrc"

# Change default
alias ls="ls --color=auto"
alias patch-dir="patch -s -p0 <"
alias rg="rg -S."

# Configuration
alias rebuild="make && sudo make install"

alias ngrok-demo="ngrok http --region=eu --hostname=gbs.eu.ngrok.io 3001"
