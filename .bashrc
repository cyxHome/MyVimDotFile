# Source global definitions
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# Bash Prompt Settings
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33m\]\w\[\033[m\]> "
export CLICOLOR=1

# OS Specific Aliases
OS=$(uname)
case "$OS" in
    'Darwin')
        export LSCOLORS='FxFxBxDxCxegedabagacad'
        alias ls='ls -FhG'
        ;;
    'Linux')
        export LS_COLORS='di=1;35;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
        alias ls='ls -Fh --color=always'

        # Regular open doesn't do what we want; xdg-open *should* exist on all Linux platforms.
        # This is a "function", which we will cover later with scripting.
        #
        #     - The $@ says "take ALL inputs", allowing for say `open *.txt`
        #     - The &> is a shorthand for 2>&1 for bash 4.0+
        #         - We are sending it to /dev/null because we don't care what it has to say (usually)...
        open () {
            xdg-open "$@" &>/dev/null
        }
        ;;
    *)
        echo "Unknown OS: $OS"
        ;;
esac

# Navigational convenience
alias l="ls -al"
alias ..="cd .."
alias cd..="cd .."
alias c="clear"
alias back="cd - > /dev/null"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
vlc () {
    nohup /Applications/VLC.app/Contents/MacOS/VLC "$@" > /dev/null 2>&1 &
}
# New build. Leave this commented out, you will likely never have a need for this (at least in this course).
# alias newbuild='rm -rf build && mkdir build && cd build && cmake ..'

# Power.  MUCH better looking grep.
#
# CAUTION: You should leave these commented out for HW1!!!
alias grep="grep -Hn --color=auto"
alias egrep="egrep -Hn --color=auto"
alias pgrep="pgrep -Hn --color=auto"
alias C11="clang++ -std=c++11 -stdlib=libc++"
