source ~/.config/zsh/.profile
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export NVM_DIR="$XDG_DATA_HOME"/nvm
export CARGO_HOME=~/.local/share/cargo
export RUSTUP_HOME=~/.local/share/rustup
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GOPATH="$XDG_DATA_HOME"/go
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

. "/home/arno/.local/share/cargo/env"
