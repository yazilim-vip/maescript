# To get branch name of current directory
parse_git_branch(){
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ ! -z "$branch" ]
    then
        if [[ $branch == "master" ]]; then
          color="\e[0;31m"
        else
            color="\e[0;36m"
        fi
        #echo "[\033[01;31m][$branch]"
        printf "$color ($branch)\e[0;32m"
    fi

}


# Syntax of Bash Prompt with the current configuration:
    # 	[<username>@<hostname> <Directory_Name>] (branch_name) $

PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$$(parse_git_branch)\[\033[00m\] '