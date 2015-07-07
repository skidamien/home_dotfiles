#!/bin/bash

# symlinks all the user dotfiles to the dotfiles in this repo
# for every dotfile found in the repo, it will back up the current dotfile
# then remove the current dot file replacing it with its matching symlink
# This should only be run once!!


#if ran from the repo dir, use pwd, 
#if not manually change it to the repo's path
path_to_this_repo=`pwd`

stampy=`date +"%d-%m-%Y_%H-%M-%S"`

for dotfile_name_in_repo in `ls | grep dot_`
do
    echo "symlinking $dotfile_name_in_repo"
    dotfile_name_in_reallife=`echo $dotfile_name_in_repo | sed 's/dot_/./g'`
    cp ~/$dotfile_name_in_reallife ~/.BACKUP_${stampy}_$dotfile_name_in_reallife
    rm ~/$dotfile_name_in_reallife
    ln -s $path_to_this_repo/$dotfile_name_in_repo ~/$dotfile_name_in_reallife
done
