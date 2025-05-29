export PROMPT='Immortal| %1~ |'
LAST_DAILY_CHECKS_FILE="$HOME/.run_daily_checks_date"
CUSTOM_PATH_FILE="$HOME/.4242_better_path"
CUSTOM_MANPATH_FILE="$HOME/.4242_better_manpath"
CURRENT_DATE=$(date | cut -d ' ' -f1-3)
LAST_RUN_DATE=""



update_paths() {
    export PATH=""

    # Xcode paths
    xcode_paths=$(/usr/bin/find /Applications/Xcode.app/Contents/Developer/ -type d | /usr/bin/grep -vi  'simulator\|\.swiftmodule\|AppIntent\|32023\|_CodeSignature\|man\|docc\|Templates\|AppleTVOS\|Platforms'| /usr/bin/tr '\n' ':')
    export PATH="$xcode_paths"

    # Default paths
    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

    # add some usr paths
    export PATH="$PATH:/usr:/usr/bin:/usr/libexec:/usr/libexec/dtrace:/usr/libexec/swift:/usr/libexec/ApplicationFirewall:/usr/sbin:/usr/local:/usr/local/bin:/usr/lib:/usr/lib/pam:/usr/lib/dtrace:/usr/lib/system:/usr/lib/swift"

    # Add Rust 
    export PATH="$PATH:/Users/Tal/.cargo/bin"

    # Add Homebrew paths
    export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"

    HOMEBREW_PREFIX=/opt/homebrew
    HOMEBREW_CELLAR=/opt/homebrew/Cellar
    HOMEBREW_REPOSITORY=/opt/homebrew
    INFOPATH=/opt/homebrew/share/info


    # Homebrew python if you want up to date
    #Python is installed as
    #  /opt/homebrew/bin/python3
    #
    #Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
    #`python3`, `python3-config`, `pip3` etc., respectively, are installed into
    #  /opt/homebrew/opt/python@3.13/libexec/bin
    #
    #See: https://docs.brew.sh/Homebrew-and-Python
    #

    # Set manpath
    export MANPATH="$(manpath):$(find /Applications/Xcode.app -type d | grep '/man/' | tr '\n' ':')"

    echo $PATH > $CUSTOM_PATH_FILE
    echo $MANPATH > $CUSTOM_MANPATH_FILE

}

run_daily_checks() {
    echo 'Running Daily Checks' 
    echo $(date) > $LAST_DAILY_CHECKS_FILE
    echo 'sudo rm -f /etc/z* && echo "cleared /etc/z*" || echo "/etc/z* already cleared"'
    sudo rm -f /etc/z* && echo "cleared /etc/z*" || echo "/etc/z* already cleared"
    echo '/usr/bin/xcode-select --install'
    /usr/bin/xcode-select --install
    echo '/usr/sbin/softwareupdate --install --all'
    /usr/sbin/softwareupdate --install --all

    
    # Update paths
    update_paths
}



LAST_RUN_DATE=$(cat "$LAST_DAILY_CHECKS_FILE" | cut -d ' ' -f1-3)
if [[ "$CURRENT_DATE" != "$LAST_RUN_DATE" ]]; then run_daily_checks ; else echo "Checks already run at $(cat $LAST_DAILY_CHECKS_FILE)"; fi

export PATH=$(/bin/cat $CUSTOM_PATH_FILE)
export MANPATH=$(/bin/cat $CUSTOM_MANPATH_FILE)

# Make control+backspace work
bindkey "^H" backward-kill-word

# Use afowler color theme from oh-my-zsh for filesystem
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# fix apropos to use new man pages
alias apropos="man -a -k -M $(echo $MANPATH)"

# Enable colorized output
alias ls="ls -G"

# vscode code command
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# Use nvim instead of vim
#alias vim="/opt/homebrew/bin/nvim"



# For ctrl+r to work with commands from long ago
HISTSIZE=10000          # Number of commands kept in memory
SAVEHIST=100000          # Number of commands saved to file
HISTFILE=~/.zsh_history # History file location (default is fine)
setopt APPEND_HISTORY   # Appends history incrementally
setopt SHARE_HISTORY    # Shares history across sessions




#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


