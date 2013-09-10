# Installation

    sudo aptitude install xfonts-terminus git vim

    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    mkdir -p ~/.vim/tmp/backup
    mkdir -p ~/.vim/tmp/swap
    mkdir -p ~/.vim/tmp/undo

    git clone git@github.com:dm3/cygwin-config ~/my_scripts
    export MY_SCRIPTS="~/my_scripts"
    cd ~/my_scripts && ./synch.sh OUT
