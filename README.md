# 🏡 Dotfiles Repository
<p align="center">
<img src="./logo.png" alt="Cute Logo" width="300">
</p>

## 🌟 Overview

Welcome to my dotfiles repository! Here you'll find my personal configuration files for various tools and applications. I use GNU Stow to manage these dotfiles, making it simple to deploy and organize my setup on different systems.

## 📋 Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Structure](#structure)
- [Customization](#customization)
- [Contributing](#contributing)

## ⚙️ Installation

To set up these dotfiles on your system, follow these steps:

1. Ensure GNU Stow is installed on your system:

    ```bash
    # For Debian-based systems
    sudo apt-get install stow

	# For Arch-based systems
	sudo pacman -S stow

    # For Red Hat-based systems
    sudo yum install stow

    # For macOS
    brew install stow
    ```

2. Clone the repository to your home directory:

    ```bash
    git clone https://github.com/smazmi/dotfiles.git ~/.dotfiles
    ```

3. Navigate to the repository:

    ```bash
    cd ~/.dotfiles
    ```

4. Use Stow to symlink specific configurations. For example, to symlink the Zsh configuration:

    ```bash
    stow .zshrc
    ```

    Repeat this step for other configurations you want to use.

## 🚀 Usage

This dotfiles repository is organized by tool or application. Use Stow to apply the configuration for a particular tool. For example:

```bash
stow kitty
stow lvim
stow neofetch
# ... and so on
```
or `stow .` can be used to symlink all the configurations at once.

Feel free to mix and match configurations based on your preferences.

## 📁 Structure

The repository structure is organized as follows:

```
.
├── .aliases
├── .config
│   ├── kitty
│   │   ├── kitty.conf
│   │   └── themes
│   │       # ... (various theme configurations)
│   ├── lvim
│   │   # ... (LVIM configurations)
│   ├── tmux
│   │   ├── tmux.conf
│   │   └── plugins
│   │       # ... (various tmux plugins)
│   └── neofetch
│       # ... (Neofetch configurations)
├── README.md
├── .stow-local-ignore 
└── .zshrc
```

Each subdirectory under `.config` corresponds to a specific tool or application with its respective configuration files.

## 🚫 Local Stow Ignore

This dotfiles repository utilizes a local stow ignore mechanism with the `.stow-local-ignore` file. It allows customization of the stowing process by excluding specified files or directories locally. 

### Purpose

The `.stow-local-ignore` file is designed to skip certain configurations during stowing, offering flexibility. This is particularly useful for keeping sensitive or machine-specific information local.

### Usage

- Examine the existing `.stow-local-ignore` file for specified patterns.
  
- Modify the file to exclude files or directories according to your preferences.

### Note

If changes are made to `.stow-local-ignore`, restow using:

```bash
stow -R configuration-name
```

By leveraging this local stow ignore feature, you can maintain a clean, organized set of configurations while respecting local nuances.
## 🛠️ Customization

Feel free to customize these dotfiles to suit your preferences. Modify the configuration files or add your own. To keep things organized, consider creating a separate folder for your custom configurations.

## 🤝 Contributing

If you have improvements or additional configurations to share, open an issue or submit a pull request. Contributions are welcome!
