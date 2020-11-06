[<< home](../README.md)
1. [Installation](./INSTALLATION.md)
2. [Scripts](./SCRIPTS.md)
3. [Auto-Complete Functions](./AUTO_COMPLETE_FUNCTIONS.md)
4. Configuration

# Configuration
There are some extra variables that you could be used for custom configuration.

### MAESCRIPT_PREFIX
This variable has default value **mae**. You should set a value for this variable before loading maescript. \
**E.g. .bashrc file**
MAESCRIPT_PREFIX=custom
source /path/to/maescrit

Then, you could use [Auto-Complete Functions](./AUTO_COMPLETE_FUNCTIONS.md) with this prefix;
* customcdir
* customdoactoin
* customconn