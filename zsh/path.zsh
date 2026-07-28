# Depends on variables.zsh for JAVA_HOME, ANDROID_SDK_ROOT and PNPM_HOME.
case "$(uname -s)" in
  Darwin) source ~/.config/zsh/path.macos.zsh ;;
esac

export PATH=$PATH:$HOME/.config/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.rbenv/shims
export PATH=$PATH:$HOME/.rbenv/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$BUN_INSTALL/bin
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PNPM_HOME:$PNPM_HOME/bin:$PATH
