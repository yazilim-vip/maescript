# Function that get possible options for the desired command
action_complete() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"

  # getting options array
  eval "declare -A opt_array=${1#*=}"

  opts=""
  for i in "${!opt_array[@]}"; do
    opt=$i
    command=${opt_array[$i]}
    opts="$opts $opt"
  done
  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}


# Change Directory Script
eval "${MAESCRIPT_PREFIX}cdir() { action \"\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)\" \$1; }"
eval "_${MAESCRIPT_PREFIX}cdir_complete() { action_complete \"\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)\"; }"
complete -F _${MAESCRIPT_PREFIX}cdir_complete ${MAESCRIPT_PREFIX}cdir

# Get Directory Script
eval "${MAESCRIPT_PREFIX}gdir() { eval \"${MAESCRIPT_PREFIX}cdir \$1 && pwd\"; }"
eval "_${MAESCRIPT_PREFIX}gdir_complete() { action_complete \"\$(declare -p MAESCRIPT_CDIR_DIRECTORIES)\"; }"
complete -F _${MAESCRIPT_PREFIX}gdir_complete ${MAESCRIPT_PREFIX}gdir

# Doaction Script
eval "${MAESCRIPT_PREFIX}doaction() { action \"\$(declare -p MAESCRIPT_DOACTION_ACTIONS)\" \$@; }"
eval "_${MAESCRIPT_PREFIX}doaction_complete() { action_complete \"\$(declare -p MAESCRIPT_DOACTION_ACTIONS)\"; }"
complete -F _${MAESCRIPT_PREFIX}doaction_complete ${MAESCRIPT_PREFIX}doaction

# Remote Connection Script#
eval "${MAESCRIPT_PREFIX}conn() { action \"\$(declare -p MAESCRIPT_CONN_REMOTES)\" \$1; }"
eval "_${MAESCRIPT_PREFIX}conn_complete() { action_complete \"\$(declare -p MAESCRIPT_CONN_REMOTES)\"; }"
complete -F _${MAESCRIPT_PREFIX}conn_complete ${MAESCRIPT_PREFIX}conn

