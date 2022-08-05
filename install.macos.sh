#!/usr/bin/env sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install iterm2 ripgrep fd neovim volta gh raycast homebrew/cask-fonts/font-hack-nerd-font koekeishiya/formulae/yabai koekeishiya/formulae/skhd cmacrae/formulae/spacebar

git clone https://github.com/blu3beri/dotfiles.git

mv dotfiles/* ~/.config/
mv dotfiles/.git ~/.config/
mv dotfiles/.gitignore ~/.config/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
