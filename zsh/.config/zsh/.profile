# vim:foldmethod=marker
# XDG Base Directory Specification
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/share/cargo/bin:$PATH"

export ZDOTDIR="$HOME"/.config/zsh
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':fzf-tab:complete:cd:*' fzf --preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf --preview 'eza -1 --color=always $realpath'
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
autoload -U compinit && compinit
fpath+=${ZSH_CUSTOM:-${ZSH:-/usr/share/oh-my-zsh}}/plugins/zsh-completions/src

# ---- fzf and fd setup for git ----{{{

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

source ~/.config/zsh/plugins/fzf-git.sh/fzf-git.sh
#}}}

export SUDO_EDITOR="nvim"            # SUDO_EDITOR use nvim
export EDITOR="nvim"                 # $EDITOR use nvim
export VISUAL="code"                 # $VISUAL use code
export SHELL="zsh"                   # $SHELL use zsh
export PATH="$PATH:$HOME/.local/bin" # Add local bin to path
export MANPAGER='nvim +Man!'         # Use nvim as manpager
export TERMINAL="kitty"              # Use kitty as terminal

# ---- History ----
export HISTFILE="$XDG_CONFIG_HOME"/zsh/.zsh_history
export HISTSIZE=1000000
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ---- eza configuration ----{{{

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
#}}}

# -------- Functions --------{{{

# ---- C compile ----{{{
function compilec {
	local filename="${1%.*}"
	local output_folder="output"

	if [ ! -d "$output_folder" ]; then
		mkdir "$output_folder"
	fi

	gcc -w "$1" -o "$output_folder/$filename" && "$output_folder/$filename"
}
#}}}

# ---- C++ compile ----{{{
function compilecpp {
	local filename="${1%.*}"
	local output_folder="output"

	if [ ! -d "$output_folder" ]; then
		mkdir "$output_folder"
	fi

	g++ -w "$1" -o "$output_folder/$filename" && "$output_folder/$filename"
}
#}}}

# ---- Java compile ----{{{
function javacom {
	local filename="${1%.*}"
	local output_folder="output"

	if [ ! -d "$output_folder" ]; then
		mkdir "$output_folder"
	fi

	javac "$1" -d "$output_folder"

	if [ $? -eq 0 ]; then
		java -cp "$output_folder" "$filename"
	else
		echo "Compilation failed. Please check your code."
	fi
}
#}}}

# ---- Rust compile ----{{{
rustcomp() {
	local filename="${1%.*}"
	local output_folder="output"

	if [ ! -d "$output_folder" ]; then
		mkdir "$output_folder"
	fi

	rustc "$1" -o "$output_folder/$filename" && "$output_folder/$filename"
}
#}}}

# ---- Extract ----{{{
function extract {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
		echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
	else
		for n in "$@"; do
			if [ -f "$n" ]; then
				case "${n%,}" in
				*.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
					tar xvf "$n"
					;;
				*.lzma) unlzma ./"$n" ;;
				*.bz2) bunzip2 ./"$n" ;;
				*.cbr | *.rar) unrar x -ad ./"$n" ;;
				*.gz) gunzip ./"$n" ;;
				*.cbz | *.epub | *.zip) unzip ./"$n" ;;
				*.z) uncompress ./"$n" ;;
				*.7z | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
					7z x ./"$n"
					;;
				*.xz) unxz ./"$n" ;;
				*.exe) cabextract ./"$n" ;;
				*.cpio) cpio -id <./"$n" ;;
				*.cba | *.ace) unace x ./"$n" ;;
				*)
					echo "extract: '$n' - unknown archive method"
					return 1
					;;
				esac
			else
				echo "'$n' - file does not exist"
				return 1
			fi
		done
	fi
}
#}}}

# ---- Docker ----{{{
dockersrm() {
	local container_id="$1"

	if [ -z "$container_id" ]; then
		echo "Usage: dockersrm <container_id>"
		return 1
	fi

	docker stop "$container_id" && docker rm "$container_id"
}
#}}}
#}}}
