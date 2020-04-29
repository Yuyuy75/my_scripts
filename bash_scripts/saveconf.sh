#!/bin/bash

vimrc_path=/home/tri/.vimrc
vimrc_save_path=/home/tri/docs/my_scripts/bash_scripts/dotfiles/
cp $vimrc_path "$save_path.vimrc$(date +_%Y-%m-%d_%H:%M:%S)" 
