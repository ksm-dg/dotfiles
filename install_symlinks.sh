#!/usr/bin/env bash
# Find all dotfiles and .config/foo/config files and create symlinks to them from home
# Be careful to test modifications to this command with an echo in the xargs first!
# Also be careful to honor the ln argument order: target linkname
#                                                   |       ^ ~/ OR a test directory
#                                                   ^ this dir
# First part of find an idiom to ignore the .git directory
find . -not \( -path "./.git" -type d -prune \) -type f -maxdepth 3 \
    ! -name ".DS_Store" -and -name ".*" -or -name "config" -or -name "karabiner.json" | 
   #sed -e 's/^\.\///' | xargs -I {} echo `pwd`/{} ~/{}
   sed -e 's/^\.\///' | xargs -I {} ln -s -f `pwd`/{} ~/{}

# VSCode settings
ln -s -f ~/projects/dotfiles/settings.json /Users/ksm/Library/Application\ Support/Code/User/settings.json
