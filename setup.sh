#! /bin/bash


ln -sf "$(realpath $(dirname ${BASH_SOURCE[0]})/zshrc)" ~/.zshrc
ln -sf "$(realpath $(dirname ${BASH_SOURCE[0]})/vimrc)" ~/.vimrc
