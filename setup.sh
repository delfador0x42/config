#! /bin/zsh




config_directory_path=$(pwd)
echo "Config path is $config_directory_path"


mkdir -p ~/.config/nvim 2>/dev/null  # Ensure ~/.config/nvim exists 
rm "$HOME/.zshrc" 2>/dev/null      # Ensure no ~/.zshrc
rm "$HOME/.vimrc" 2>/dev/null      # Ensure no ~/.vimrc
rm "$HOME/.config/nvim/init.vim" 2>/dev/null # Ensure no ~/.config/nvim/init.vim


ln -s "$(pwd)/zshrc" "$HOME/.zshrc" # create ~/.zshrc softlink
ln -s "$(pwd)/vimrc" "$HOME/.vimrc" # create ~/.vimrc softlink
ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim" # create ~/.config/nvim/init.vim softlink



# ########################################################################## #
# The purpose of the lines below is to sync this config directory to github  #
# everytime I change a config file (ie .vimrc or .zshrc)                     #
# ########################################################################## #


# Check for lock word in zshrc, we don't want to write to it more than once
if ! grep -q "config_directory_sync_lock" "$config_directory_path/zshrc"; then

# Write lock word to zshrc, so that we don't write to it more than once
echo '# config_directory_sync_lock' >> $config_directory_path/zshrc

# Basically we want to check if the config directory has been moved since this setup.sh has been run
echo '# First, go to the config directory safely.' >> $config_directory_path/zshrc
echo "if ! cd \"$config_directory_path\"; then" >> $config_directory_path/zshrc

# Write the auto git sync lines
cat << 'EOF' >> $config_directory_path/zshrc
    echo "Error: Failed to enter config directory."
    exit 1
fi

# Check if there are any changes to sync.
if [[ -n $(git status --porcelain) ]]; then
    echo '======================Sync Config file to Github======================'
    git add . &&
    git commit -m "Update Config" &&
    git push origin main
    echo '======================Finished syncing config to github======================' 
fi
cd ~ &> /dev/null
EOF

else
    echo "setup.sh has already been run, delete the git sync lines in zshrc to write to it again"
fi

