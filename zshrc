export PROMPT='Immortal| %1~ |'


# Default path from fresh MacOS 15.0 vm
export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"


# Make control+backspace work
bindkey "^H" backward-kill-word


# Add Homebrew
export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"

HOMEBREW_PREFIX=/opt/homebrew
HOMEBREW_CELLAR=/opt/homebrew/Cellar
HOMEBREW_REPOSITORY=/opt/homebrew
INFOPATH=/opt/homebrew/share/info:

# Add Rust
export PATH="$PATH:/Users/Tal/.cargo/bin"


# Use afowler color theme from oh-my-zsh for filesystem
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable colorized output
alias ls="ls -G"

# Use nvim instead of vim
alias vim="/opt/homebrew/bin/nvim"

# Use zoxide instead of cd
eval "$(/opt/homebrew/bin/zoxide init --cmd cd zsh)"

# vscode code command
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"


# For ctrl+r to work with commands from long ago
HISTSIZE=10000          # Number of commands kept in memory
SAVEHIST=50000          # Number of commands saved to file
HISTFILE=~/.zsh_history # History file location (default is fine)
setopt APPEND_HISTORY   # Appends history incrementally
setopt SHARE_HISTORY    # Shares history across sessions
setopt HIST_IGNORE_DUPS # Prevents duplicates cluttering history




# config_directory_sync_lock
# First, go to the config directory safely.
if ! cd "/Users/Tal/config"; then
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
