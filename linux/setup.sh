#!/usr/bin/env sh

# packages: git, vim, neovim, alacritty, rust-analyzer xorg-xbacklight
# xorg-xinput xorg-setxkbmap xf86-video-intel alsa-utils man-db zsh xclip
# base-devel github-cli

CONF=$HOME/.config
LINUX_CONF=$CONF/linux

echo "-- timezone --"
sudo ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

echo "-- clone --"
git clone https://github.com/blu3beri/dotfiles.git $CONF

echo "-- zsh --"
ln -sf $CONF/zsh/zshrc $HOME/.zshrc

echo "-- vim --"
ln -sf $CONF/vim/vimrc $HOME/.vimrc

echo "-- xorg config --"
sudo cp -r $LINUX_CONF/*.conf /etc/X11/xorg.conf.d/

echo "-- xinitrc --"
sudo ln -sf $LINUX_CONFIG/xinitrc $HOME/.xinitrc

echo "-- yay --"
yes | (git clone https://aur.archlinux.org/yay.git $HOME/yay && cd $HOME/yay && makepkg -si)

echo "-- rust --"
(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y)

echo "-- status bar --"
(git clone https://github.com/blu3beri/thinkpad-dwm-statusbar $HOME/thinkpad-dwm-statusbar \
  && cd $HOME/thinkpad-dwm-statusbar \
  && cargo build --release \
  && sudo mv target/release/status_bar /usr/local/bin/thinkpad_status_bar)
