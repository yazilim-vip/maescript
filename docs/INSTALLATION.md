[<< home](../README.md)

## Install with Setup Script
**Bash**
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yazilim-vip/maescript/main/install.sh)"
```

**ZSH**
```sh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/yazilim-vip/maescript/main/install.sh)"
```

## Install manually
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

# Options
MAESCRIPT_PREFIX=customprefix
.