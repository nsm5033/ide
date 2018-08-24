# Load in bash_completion if we can find it.
if [[ -r /usr/local/etc/bash_completion ]]
then
    source /usr/local/etc/bash_completion
elif [[ -r /usr/share/bash-completion/bash_completion ]]
then
    source /usr/share/bash-completion/bash_completion
else
    echo "# Can't find bash-completion. You should install it." >&2
fi

# set up git ps1
if ! command -v __git_ps1 > /dev/null 2>&1
then
    echo "# Can't find __git_ps1. Not adding it to the prompt." >&2
    __git_ps1() { return 0; }
fi

# only works if using __git_ps1 as a PROMPT_COMMAND
# export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

git_prompt_help() {
    column -t -s $'\t' <<EOF
EOF
EOF
*       unstaged changes
+       staged changes
$       stashes
%       untracked files
<       behind
>       ahead
<>      diverged
=       no difference
EOF
}

export DEFAULT_PS1='\e[0;36m\n\d \t \u@\H\n\w $(__git_ps1)\e[m\n\$ '
export PS1="$DEFAULT_PS1"