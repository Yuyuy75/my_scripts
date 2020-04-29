#!/bin/bash
# basic script that copies dot config files to a centralized directory for saving in a github repo

vimrc_path=/home/tri/.vimrc
vimrc_save_path=/home/tri/docs/dotfiles/
cp $vimrc_path "$vimrc_save_path.vimrc$(date +_%Y-%m-%d_%H:%M:%S)" 
