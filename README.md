# Dotfiles Repository

![Cute Logo](./logo.png)

## Overview

Welcome to my dotfiles repository! Here you'll find my personal configuration files for various tools and applications. I use GNU Stow to manage these dotfiles, making it simple to deploy and organize my setup on different systems.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Structure](#structure)
- [Customization](#customization)
- [Contributing](#contributing)

## Installation

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

## Usage

This dotfiles repository is organized by tool or application. Use Stow to apply the configuration for a particular tool. For example:

```bash
stow kitty
stow lvim
stow neofetch
# ... and so on
```

Feel free to mix and match configurations based on your preferences.

## Structure

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
│   └── neofetch
│       # ... (Neofetch configurations)
├── README.md
└── .zshrc
```

Each subdirectory under `.config` corresponds to a specific tool or application with its respective configuration files.

## Customization

Feel free to customize these dotfiles to suit your preferences. Modify the configuration files or add your own. To keep things organized, consider creating a separate folder for your custom configurations.

## Contributing

If you have improvements or additional configurations to share, open an issue or submit a pull request. Contributions are welcome!
