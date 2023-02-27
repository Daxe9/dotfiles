if status is-interactive
    # Commands to run in interactive sessions can go here
end

function swap_profile
    set audio_1 "a2dp_sink"
    set audio_2 "handsfree_head_unit"

    printf "1. %s\n2. %s\n" $audio_1 $audio_2
    read -l -P "Select profile [1/2]: " choice

    switch $choice
        case 1
            pactl set-card-profile bluez_card.00_1B_66_C8_64_E2 $audio_1
        case 2
            pactl set-card-profile bluez_card.00_1B_66_C8_64_E2 $audio_2
        case '*'
            echo "Invalid choice"
    end
end

function swap_layout
    set layout_1 "us"
    set layout_2 "it"

    printf "1. %s\n2. %s\n" $layout_1 $layout_2
    read -l -P "Select profile [1/2]: " choice

    switch $choice
        case 1
            setxkbmap $layout_1
        case 2
            setxkbmap $layout_2
        case '*'
            echo "Invalid choice"
    end
end


## hide greeting message
set fish_greeting

# set fetch
macchina

## custom alias
alias :q='exit'
alias :Q='exit'
alias cat='bat'
alias nvimconfig="nvim ~/.config/nvim/"
alias v="nvim"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias reload="source ~/.config/fish/config.fish"
alias school="cd ~/school"

alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | egrep '^\.'"

## node
nvm use lts >> /dev/null

## enable rustup in PATH
export PATH="$HOME/.cargo/bin:$PATH"

