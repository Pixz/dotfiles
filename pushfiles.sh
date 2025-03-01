#!/bin/bash

rsync -a ~/.config/ ~/dotfiles/sources/
rsync -a ~/.bash_custom/ ~/dotfiles/sources/
rsync -a ~/.tmux.conf ~/.bashrc ~/dotfiles/sources/
