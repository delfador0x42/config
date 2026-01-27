export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PROMPT='Immortal| %1~ |'


# Save command history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=99999999
export SAVEHIST=99999999
export TMPDIR=""
export SSH_AUTH_SOCK=""


#eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal Colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls="ls -G"


# vscode
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code" 


#export EDITOR='vim'


#Immortal| ~ |/opt/homebrew/bin/brew shellenv
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
#fpath[1,0]="/opt/homebrew/share/zsh/site-functions";

#eval "$(/usr/bin/env PATH_HELPER_ROOT="/opt/homebrew" /usr/libexec/path_helper -s)"
#Immortal| ~ |/usr/bin/env PATH_HELPER_ROOT="/opt/homebrew" /usr/libexec/path_helper -s
#PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin"; export PATH;
PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"


#[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
#export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
