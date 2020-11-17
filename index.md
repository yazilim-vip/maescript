Currently only **bash** and **zsh** shells supported.
1. [Scripts](./docs/SCRIPTS.md)
2. [Auto-Complete Functions](./docs/AUTO_COMPLETE_FUNCTIONS.md)
3. [Configuration](./docs/CONFIGURATION.md)

## Installation

### Install with Setup Script
**Bash**
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yazilim-vip/maescript/main/install.sh)"
```

**ZSH**
```sh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/yazilim-vip/maescript/main/install.sh)"
```

### Install manually
1. Clone repository into a directory
2. For bash; add following lines to your .bashrc file
   ```sh
   MAESCRIPT_HOME=/path/to/repo
   source /path/to/repo/init.sh bash
   ``` 
3. For zsh; add following line to your .zshrc file
   ```sh
   MAESCRIPT_HOME=/path/to/repo
   source /path/to/repo/init.sh zsh
   ```