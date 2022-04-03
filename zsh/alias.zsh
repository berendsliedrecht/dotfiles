DEV="~/Developer/"
TMP="${DEV}/tmp"
WORK="${DEV}/work"
PERSONAL="${DEV}/personal"
ANIMO="${WORK}/animo"
HYPERLEDGER="${WORK}/hyperledger"
ESSIF="${WORK}/essif"

# Directories
alias tmp="cd ${TMP}"
alias work="cd ${WORK}"
alias per="cd ${PERSONAL}"
alias animo="cd ${ANIMO}"
alias hype="cd ${HYPERLEDGER}"
alias esf="cd ${ESSIF}"

# Editting
alias doom="~/.emacs.d/bin/doom"
alias v="vim"
alias nv="nvim"
alias c="code ."
alias als="vim ~/.config/zsh/alias.zsh"

# Sourcing
alias szsh="source ~/.zshrc"

# Change default
alias ls="ls --color=auto"
alias patch-dir="patch -s -p0 <"

# Configuration
alias rebuild="make && sudo make install"
