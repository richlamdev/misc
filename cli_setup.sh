#!/bin/bash
# import vimrc and customize bash prompt PS1 environment variable.

cp .vimrc ~/.vimrc
#echo 'export PS1="\[\033[38;5;214m\]\A\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\][\[$(tput sgr0)\]\[\033[38;5;4m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;11m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"' >> ~/.bashrc

echo 'export PS1="\[\033[38;5;208m\]\A\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;3m\][\[$(tput sgr0)\]\[\033[38;5;33m\]\u\[$(tput sgr0)\]\[\033[38;5;2m\]@\[$(tput sgr0)\]\[\033[38;5;213m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;3m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"' >> ~/.bashrc

source ~/.bashrc
