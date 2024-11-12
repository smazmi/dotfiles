# vim:foldmethod=marker
# ---- Path to your oh-my-zsh installation ----
ZSH=/usr/share/oh-my-zsh/

# ---- Path to powerlevel10k theme ----
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# ---- Path to your .profile file ----
source $HOME/.config/zsh/.profile

# ---- Plugins ----{{{
plugins=(
  git 
sudo
zsh-256color
zsh-autosuggestions
zsh-syntax-highlighting
copybuffer
copypath
dirhistory
web-search
zsh-autopair
fzf-tab
fzf-docker
)# }}}


# ---- Oh-my-zsh ----
source $ZSH/oh-my-zsh.sh

# ---- fzf ----
source /usr/share/fzf/key-bindings.zsh 
source /usr/share/fzf/completion.zsh 

# ---- zoxide ----
eval "$(zoxide init zsh)"


# ---- Command not found handler ----{{{
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}
#}}}

# ---- AUR wrapper detection ----{{{
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi
#}}}

# ---- Function to install packages ----{{{
function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}
#}}}


# ---- Helpful aliases ----
source $ZDOTDIR/.aliases

# ---- Helpful Key-bindings ----
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ---- To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. ----
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh

# ---- Display Pokemon ----
pokemon-colorscripts --no-title -r 1,3,6

