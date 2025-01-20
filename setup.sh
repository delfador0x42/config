#! /bin/zsh



mkdir $HOME/.config 2>/dev/null  # Ensure ~/.config exists
rm $HOME/.zshrc 2>/dev/null      # Ensure no ~/.zshrc
rm $HOME/.vimrc 2>/dev/null      # Ensure no ~/.vimrc
rm $HOME/.config/nvim/init.vim 2>/dev/null # Ensure no ~/.config/nvim/init.vim

ln -s $(pwd)/zshrc $HOME/.zshrc # make zshrc
ln -s $(pwd)/vimrc $HOME/.vimrc # make vimrc
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim # make neovim config
