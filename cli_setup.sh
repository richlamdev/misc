#!/bin/bash
# import vimrc and customize bash prompt PS1 environment variable.

cp .vimrc ~/.vimrc
export PS1="\[\033[38;5;214m\]\A\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\][\[$(tput sgr0)\]\[\033[38;5;4m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;11m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

source ~/.bashrc
