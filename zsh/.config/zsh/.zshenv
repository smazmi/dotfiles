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
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PYTHONSTARTUP="$HOME"/python/pythonrc
export _ZL_DATA="$XDG_DATA_HOME/zlua"
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export GPG_TTY=$(tty)
export WINEPREFIX="$XDG_DATA_HOME"/wine
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials                      
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export ANDROID_SDK_ROOT=$HOME/Android/Sdk/
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

. "/home/arno/.local/share/cargo/env"
