#!/bin/bash
# Quickly import vimrc and customize bash prompt PS1 environment variable.

cp .vimrc ~/.vimrc
echo 'export PS1="\A \[\e[31m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:[\[\e[33m\]\w\[\e[m\]]\\$ "' >> ~/.bashrc

source ~/.bashrc
