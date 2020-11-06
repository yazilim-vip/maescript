# Locate Script DIR
shell_mode=$1

# Current Version of Maescript
MAESCRIPT_VERSION="v1.00-beta"

# Prefix for AutoComplete Scripts
MAESCRIPT_PREFIX="mae"

# Configuration Directory that Maescript will be stored
MAESCRIPT_USER_CONFIG_DIR=$(eval echo ~$USER)/.config/maescript

# Configuration Backup Directory
MAESCRIPT_USER_BACUP_DIR=$MAESCRIPT_USER_CONFIG_DIR

# Initialize Binary Path
PATH=$PATH:$MAESCRIPT_HOME/bin

echo "here"
# Aliases
alias reconf='source ~/.bashrc'

# Source Scripts
source $MAESCRIPT_HOME/src/autocomplete-functions.sh
source $MAESCRIPT_HOME/src/user-configuration.sh
source $MAESCRIPT_HOME/src/$shell_mode/init.sh