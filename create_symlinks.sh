#!/bin/bash
# ----------------------------------------------------------------------------
# "THE MODIFIED BEER-WARE LICENSE"
# <git@bbgen.net> wrote this file. You can do whatever you want with this stuff.
# If we meet some day, and you think this stuff is worth it, you can buy me a
# beer in return Bernhard Eder
# ----------------------------------------------------------------------------

if [[ `uname -s` == MINGW32_* ]]; then
	SYMLINK="cp -rfu"
	DESTINATION=~/vimfiles/
	echo Using Windows configuration
else
	SYMLINK="ln -sf"
	DESTINATION=~/.vim/
	echo Using Linux configuration
fi

$SYMLINK `pwd`/bashrc ~/.bashrc
$SYMLINK `pwd`/screenrc ~/.screenrc
$SYMLINK `pwd`/vimrc ~/.vimrc
$SYMLINK `pwd`/gvimrc ~/.gvimrc
$SYMLINK `pwd`/gitconfig ~/.gitconfig

if [ `uname -s` == "MINGW32_NT-6.1" ]; then
	rm -rf ~/.vim/
	mkdir -p ~/.vim/
fi

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

#$SYMLINK `pwd`/vim/after ~/.vim/after
$SYMLINK `pwd`/vim/autoload $DESTINATION/autoload
#$SYMLINK `pwd`/vim/doc ~/.vim/doc
#$SYMLINK `pwd`/vim/plugin ~/.vim/plugin
$SYMLINK `pwd`/vim/bundle $DESTINATION/bundle

