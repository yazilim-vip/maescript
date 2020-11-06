Very useful set of linux commands

# Features
## Scripts

### Tureng
python script what provides translation CLI based on [tureng](https://tureng.com)

```
Usage: tureng [-m] <word1> <word2> .. <word n>
Options:
  -m     to get detailed info about word
```
#### Example
```
tureng car
```
**Output:** [example_output.png](./docs/ex_tureng.png)

### JDK Installer
to install Java JDK from *tar* archive from given path

```
Usage: jdk-install <JDK_ARCHIVE_PATH>
Options:
  JDK_ARCHIVE_PATH      Path to JDK Archive file to install
```

### portkill
to kill a process that allocates given port
```
Usage: portkill <port>
Options:
  port      port to be idle
```

(documentation will be updated in time)

**NOTE** Currently only bash fully supported. zsh **partially** supported

# Installation

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
