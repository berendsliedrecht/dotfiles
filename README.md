# .config

Dotfiles for macOS and Linux. OS-specific zsh bits are split via `uname` in
`zsh/variables.zsh` and `zsh/path.zsh`.

## Setup

```sh
git clone <repo> ~/.config
ln -s ~/.config/zsh/zshrc ~/.zshrc
```

`zsh/path.zsh` puts `~/.config/bin` on PATH.

### Linux

```sh
sudo cp ~/.config/linux/*.conf /etc/X11/xorg.conf.d/
ln -s ~/.config/linux/xinitrc ~/.xinitrc
```
