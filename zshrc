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
