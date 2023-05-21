DEV="$HOME/Developer"
CONTAINERS="$DEV/containers"
CONFIG="$HOME/.config"
TMP="$DEV/tmp"
WORK="$DEV/work"
SCHOOL="$DEV/school"
PERSONAL="$DEV/personal"
ANIMO="$WORK/animo"
HYPERLEDGER="$WORK/hyperledger"
ESSIF="$WORK/essif"
IDCRYPT="$WORK/idcrypt"
NOTEBOOK="$HOME/notes"
OPENWALLET="$WORK/openwallet-foundation"

# Directories
alias tmp="cd $TMP"
alias work="cd $WORK"
alias per="cd $PERSONAL"
alias sch="cd $SCHOOL"
alias animo="cd $ANIMO"
alias hype="cd $HYPERLEDGER"
alias owf="cd $OPENWALLET"
alias esf="cd $ESSIF"
alias conf="cd $CONFIG"
alias idc="cd $IDCRYPT"
alias notes="cd $NOTEBOOK"
alias owf="cd $OPENWALLET"

# Editting
alias v="vim"
alias nv="nvim"
alias als="vim ~/.config/zsh/alias.zsh"

# Sourcing
alias szsh="source ~/.zshrc"

# Change default
alias ls="ls --color=auto"
alias patch-dir="patch -s -p0 <"
alias rg="rg -S."
alias tree="tree --gitignore"

# Configuration
alias rebuild="make && sudo make install"
alias vrc="vim ~/.vimrc"
alias ngrok-demo="ngrok http --region=eu --hostname=gbs.eu.ngrok.io 3001"
