$env.config.buffer_editor = "nvim"
$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
$env.CUDA_CACHE_PATH = $"($env.XDG_CACHE_HOME)/nv"
$env.NVM_DIR = $"($env.XDG_DATA_HOME)/nvm"
$env.CARGO_HOME = "~/.local/share/cargo"
$env.RUSTUP_HOME = "~/.local/share/rustup"
$env.PARALLEL_HOME = $"($env.XDG_CONFIG_HOME)/parallel"
$env.NPM_CONFIG_USERCONFIG = $"($env.XDG_CONFIG_HOME)/npm/npmrc"
$env.GRADLE_USER_HOME = $"($env.XDG_DATA_HOME)/gradle"
$env.GOPATH = $"($env.XDG_DATA_HOME)/go"
$env.ANDROID_USER_HOME = $"($env.XDG_DATA_HOME)/android"
$env.NODE_REPL_HISTORY = $"($env.XDG_DATA_HOME)/node_repl_history"
$env.PYTHONSTARTUP = "~/python/pythonrc"
$env._ZL_DATA = $"($env.XDG_DATA_HOME)/zlua"
$env.ANSIBLE_HOME = $"($env.XDG_DATA_HOME)/ansible"
$env.WAKATIME_HOME = $"($env.XDG_CONFIG_HOME)/wakatime"
$env.PASSWORD_STORE_DIR = $"($env.XDG_DATA_HOME)/pass"
$env.WINEPREFIX = $"($env.XDG_DATA_HOME)/wine"
$env.AWS_SHARED_CREDENTIALS_FILE = $"($env.XDG_CONFIG_HOME)/aws/credentials"
$env.AWS_CONFIG_FILE = $"($env.XDG_CONFIG_HOME)/aws/config"
$env.ANDROID_SDK_ROOT = "~/Android/Sdk"
$env.ANDROID_HOME = "~/Android/Sdk"
$env.PNPM_HOME = $"($env.XDG_DATA_HOME)/pnpm"
$env.DOCKER_CONFIG = $"($env.XDG_CONFIG_HOME)/docker"
$env.BUN_INSTALL = $"($env.XDG_DATA_HOME)/bun"
$env.STARSHIP_CONFIG = $"($env.XDG_CONFIG_HOME)/starship/starship.toml"

# PATH
$env.PATH = ($env.PATH | append [
    $"($env.PNPM_HOME)"
    $"($env.ANDROID_HOME)/emulator"
    $"($env.ANDROID_HOME)/platform-tools"
    "$GOROOT/bin"
    $"($env.GOPATH)/bin"
    $"($env.XDG_DATA_HOME)/npm/bin"
    $"($env.BUN_INSTALL)/bin"
])
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' 
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
zoxide init --cmd cd nushell | save -f ~/.config/nushell/zoxide.nu
