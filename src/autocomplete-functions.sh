##################################
# Default Autocomplete Options
##################################
# CDIR
declare -A MAESCRIPT_CDIR_DIRECTORIES=(
  [maehome]="cd $MAESCRIPT_HOME"
  [maeconfig]="cd $MAESCRIPT_USER_CONFIG_DIR"
  [maebin]="cd $MAESCRIPT_HOME/bin"
)

# DOACTION
declare -A MAESCRIPT_DOACTION_ACTIONS=(
  [tureng]='b:tureng'
  [portkill]='b:portkill'
  [installjdk]='b:jdk-install'
  [version]='echo "Currently you are using ${MAESCRIPT_VERSION}"'
  [update]="cd $MAESCRIPT_HOME && git pull origin main"
  [confexport]='echo "Taking backup..." && cd $MAESCRIPT_USER_CONFIG_DIR && tar cvfz "$MAESCRIPT_USER_BACUP_DIR/`date +%Y%m%d%H%M`-maescript_conf_backup.tar.gz" conf.d/*'
)

# Connection
declare -A MAESCRIPT_CONN_REMOTES=()

# Function to execute selected command with option
action() {
  # getting options array
  eval "declare -A opt_array=${1#*=}"

  if [ "${opt_array[$2]}" ]; then
    value=${opt_array[$2]}
    #echo "Value is : $value"
    if [[ $value == f:* ]]; then
      #echo "Loding file ;)"
      filename=${value:2}
      eval "$MAESCRIPT_USER_CONFIG_DIR/$filename ${*:3}"
    elif [[ $value == b:* ]]; then
      #echo "Executing Command directly"
      filename=${value:2}
      eval "$MAESCRIPT_HOME/bin/$filename ${*:3}"
    else
      eval "$value ${*:3}"
    fi
  else
    echo "Option Not Found"
  fi
}