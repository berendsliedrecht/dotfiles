export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export BUN_INSTALL="$HOME/.bun"
export ANDROID_AVD_HOME="$XDG_CONFIG_HOME/.android/avd"
export DOCKER_HOST="unix:///var/run/docker.sock"
export FZF_DEFAULT_OPTS='--color=bw'

case "$(uname -s)" in
  Darwin) source ~/.config/zsh/variables.macos.zsh ;;
  Linux)  source ~/.config/zsh/variables.linux.zsh ;;
esac

# Depends on ANDROID_SDK_ROOT, which the OS-specific files set above.
export ANDROID_HOME="$ANDROID_SDK_ROOT"

