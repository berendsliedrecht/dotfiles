autoload -Uz compinit
# full compinit (with security check) at most once a day, -C otherwise
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
