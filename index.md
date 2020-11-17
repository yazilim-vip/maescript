Very useful set of linux commands and configurations to enhance your terminal experience on Linux. \
Currently only **bash** and **zsh** shells supported.

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

## Scripts
### Tureng
python script what provides translation CLI based on [tureng](https://tureng.com)

```
Usage: tureng [-m] <word1> <word2> .. <word n>
Options:
  -m     to get detailed info about word
```
**Example**
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


## Auto-Complete Functions
* There are pre-defined functions that could be auto-complete options added. 
* The key point for using this auto-complete functions is that, you allowed to your autocomplete options easily
* To call each of them, you could use prefix (which should be configured manually)
  * e.g. maedoaction, maecdir, maeconn

### cdir
To collect your folders so that you can navigate faster. \
**Pre-Defined Directories** 
* maehome : installation directory of maescript
* maeconfig : config folder for maescript
* maebin : folder that binaries store

### doaction 
To collect your useful actions, commands etc. so that you can execute that command faster \
**Pre-Defined Actions** 
* tureng: tureng script
* portkill: port kill script
* installjdk: jdk install script
* version: learn maescript version
* update: update maescript insallation
* confexport: export your maescript configuration (you should pass export dir as argument e.g.: maedoaction confexport /path/to/backup)

### conn
To collect your useful remote server connection commands so that you can connect  faster


## Configuration
There are some extra variables that you could be used for custom configuration.

### MAESCRIPT_PREFIX
This variable has default value **mae**. You should set a value for this variable before loading maescript. \
**E.g. .bashrc file**
MAESCRIPT_PREFIX=custom
source /path/to/maescrit

Then, you could use Auto-Complete Functions with this prefix;
* customcdir
* customdoactoin
* customconn