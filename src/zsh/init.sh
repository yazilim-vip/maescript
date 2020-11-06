############################
# Helper Functions
############################
# Function that get possible options for the desired command
action_complete() {

    local cur prev opts

    opts=()
    eval "declare -A opt_array=${1#*=}"
    for key val in ${(kv)opt_array}; do
        opts=($key $opts)
    done

    _arguments -C \
        "-h[Show help information]" \
        "--h[Show help information]" \
        "1: :($opts)" \
        "*::arg:->args"



    # # getting options array
    # eval "declare -A opt_array=${1#*=}"
    # opts=""
    # for i in "${!opt_array[@]}"
    # do
    #     echo "$i"
    #     echo "${opt_array[$i]}"
    #     echo "$opts $opt"
    # done
}


ZSH_AUTOCOMPLETION_DIR=$MAESCRIPT_HOME/zsh-completions
rm -rf ${ZSH_AUTOCOMPLETION_DIR}
mkdir -p ${ZSH_AUTOCOMPLETION_DIR}

# Change Directory Script
eval "\${MAESCRIPT_PREFIX}cdir()  action \"\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)\" \$1; "
cat <<EOT >> ${ZSH_AUTOCOMPLETION_DIR}/_${MAESCRIPT_PREFIX}cdir
#compdef ${MAESCRIPT_PREFIX}cdir

_${MAESCRIPT_PREFIX}cdir() {
    action_complete "\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)"
}

_${MAESCRIPT_PREFIX}cdir
EOT

# Get Directory Script
eval "\${MAESCRIPT_PREFIX}gdir()  eval \"${MAESCRIPT_PREFIX}cdir \$1 && pwd\"; "
cat <<EOT >> ${ZSH_AUTOCOMPLETION_DIR}/_${MAESCRIPT_PREFIX}gdir
#compdef ${MAESCRIPT_PREFIX}gdir

_${MAESCRIPT_PREFIX}gdir() {
    action_complete "\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)"
}

_${MAESCRIPT_PREFIX}gdir
EOT


# Doaction Script
eval "\${MAESCRIPT_PREFIX}doaction()  action \"\$(declare -p MAESCRIPT_DOACTION_ACTIONS)\" \$@; "
cat <<EOT >> ${ZSH_AUTOCOMPLETION_DIR}/_${MAESCRIPT_PREFIX}doaction
#compdef ${MAESCRIPT_PREFIX}doaction

_${MAESCRIPT_PREFIX}doaction() {
    action_complete "\$(declare -p MAESCRIPT_DOACTION_ACTIONS)"
}

_${MAESCRIPT_PREFIX}doaction
EOT


# Remote Connection Script#
eval "\${MAESCRIPT_PREFIX}conn()  action \"\$(declare -p MAESCRIPT_CONN_REMOTES)\" \$1; "
cat <<EOT >> ${ZSH_AUTOCOMPLETION_DIR}/_${MAESCRIPT_PREFIX}conn
#compdef ${MAESCRIPT_PREFIX}conn

_${MAESCRIPT_PREFIX}conn() {
    action_complete "\$(declare -p MAESCRIPT_CONN_REMOTES)"
}

_${MAESCRIPT_PREFIX}conn
EOT

fpath=(${ZSH_AUTOCOMPLETION_DIR} $fpath)
autoload -U compinit
compinit