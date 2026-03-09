#export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin"
export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/System/Cryptexes/App/usr/bin"
export PROMPT='Immortal| %1~ |'


# Save command history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt INC_APPEND_HISTORY # write command to disk immediately
setopt SHARE_HISTORY # Share history across terminals
setopt EXTENDED_HISTORY # timestamps



#eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal Colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls="ls -G"


# vscode
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code" 


# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"



# rust
. "$HOME/.cargo/env"




# pnpm
export PNPM_HOME="/Users/tal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


export CLAUDE_CODE_MAX_OUTPUT_TOKENS=100000


# === misc notes ===

# Mac

# git config --global init.defaultBranch
# git config --global init.defaultBranch master
# git config --global init.defaultBranch 


# sudo caffeinate -dimsu -t 999999999
# cargo install basalt-tui                                   


# Linux

# mkdir -p ~/.config/nvim && echo "set clipboard=unnamedplus" > ~/.config/nvim/init.vim
# systemd-inhibit sleep 3600
# zle -N toggle_oneline_prompt
# bindkey ^P toggle_oneline_prompt









