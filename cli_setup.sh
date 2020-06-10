#!/bin/bash
# import vimrc and customize bash prompt PS1 environment variable.

cp .vimrc ~/.vimrc
export PS1="\[\e[33m\]\A\[\e[m\] \[\e[36m\][\[\e[m\]\[\e[34m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\] \w\[\e[36m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

source ~/.bashrc
