if status is-interactive
    # Commands to run in interactive sessions can go here
end

## hide greeting message
set fish_greeting

## custom alias
alias :q='exit'
alias nvimconfig="nvim ~/.config/nvim/"
alias v="nvim"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | egrep '^\.'"

## node
nvm use lts >> /dev/null

## enable rustup in PATH
export PATH="$HOME/.cargo/bin:$PATH"

starship init fish | source
