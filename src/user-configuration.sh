##################################
# Initialize User-Configuration
##################################

if [ -d "$MAESCRIPT_USER_CONFIG_DIR/conf.d" ]; then
  ### Take action if $DIR exists ###
  # echo "Loading configurations at ${MAESCRIPT_USER_CONFIG_DIR}/conf.d/default.conf..."
  for f in $MAESCRIPT_USER_CONFIG_DIR/conf.d/*.conf; do source $f; done
else
  ###  Control will jump here if $DIR does NOT exists ###
  # echo "${MAESCRIPT_USER_CONFIG_DIR}/conf.d/default.conf file not found. Creating empty one."

  # Creating config directory
  mkdir -p $MAESCRIPT_USER_CONFIG_DIR/conf.d

  # Creating config file
  touch $MAESCRIPT_USER_CONFIG_DIR/conf.d/default.conf

  # Writing default
  cat <<EOT >> $MAESCRIPT_USER_CONFIG_DIR/conf.d/default.conf

#!/bin/bash

# Add directory and a key for it directory as follows:
#   [<key>]='<directory>'
#
# e.g. => MAESCRIPT_CDIR_DIRECTORIES[archive]='cd /home/user/archive'

# Add action and a key for it as follows:
#   [<key>]='<action>'
#
# e.g. => MAESCRIPT_DOACTION_ACTIONS[hello]='echo "Hello World"'

# Add remote connection command and a key for it as follows:
#   [<key>]='<remote_connection>'
#
# e.g. => MAESCRIPT_CONN_REMOTES[remote]='ssh user@remote'


EOT

fi
