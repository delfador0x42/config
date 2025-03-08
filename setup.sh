#! /bin/zsh




config_directory_path=$(pwd)
echo "Config path is $config_directory_path"

#mkdir -p ~/.config/nvim 2>/dev/null  # Ensure ~/.config/nvim exists 
#rm "$HOME/.zshrc" 2>/dev/null      # Ensure no ~/.zshrc
#rm "$HOME/.vimrc" 2>/dev/null      # Ensure no ~/.vimrc
#rm "$HOME/.config/nvim/init.vim" 2>/dev/null # Ensure no ~/.config/nvim/init.vim
#
#
#ln -s "$(pwd)/zshrc" "$HOME/.zshrc" # create ~/.zshrc softlink
#ln -s "$(pwd)/vimrc" "$HOME/.vimrc" # create ~/.vimrc softlink
#ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim" # create ~/.config/nvim/init.vim softlink



echo '# First, go to the config directory safely.' >> $config_directory_path/zshrc
echo "if ! cd \"$config_directory_path\"; then" >> $config_directory_path/zshrc
cat << 'EOF' >> $config_directory_path/zshrc
    echo "Error: Failed to enter config directory."
    exit 1
fi

# Check if there are any changes to sync.
if [[ -n $(git status --porcelain) ]]; then
    git add . &&
    git commit -m "Update Config" &&
    git push origin main ||
    echo "Sync Config file to Github"
fi
EOF

## First, go to the config directory safely.
#if ! cd "$config_directory_path"; then
#    echo "Error: Failed to enter config directory."
#    exit 1
#fi
#
## Check if there are any changes to sync.
#if [[ -n $(git status --porcelain) ]]; then
#    git add . &&
#    git commit -m "Update Config" &&
#    git push origin main ||
#    echo "Sync Config file to Github"
#fi
