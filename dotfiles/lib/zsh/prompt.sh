function current_directory() {
    local PWD=$(pwd)
    echo "${PWD/#$HOME/~}"
}

function git_prompt_info() {
    if test -z $(parse_git_branch);
    then
        echo ""
    else
        echo " %{$FG[239]%}on%{$reset_color%} %{$FG[255]%}$(parse_git_branch)%{$reset_color%}$(git_status_character)"
    fi
}

function git_status_character() {
    if git_is_dirty;
    then
        echo "%{$FG[202]%}✘%{$reset_color%}"
    else
        echo "%{$FG[040]%}✔%{$reset_color%}"
    fi
}

function sandbox_prompt() {
    if [ ! -z "$(sandbox_prompt_info)" ];
    then
        echo " %{$FG[239]%}with $(colored_sandbox_string)%{$reset_color%}"
    fi
}

PROMPT='╭─% %{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(hostname -s)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}$(current_directory)%{$reset_color%}$(git_prompt_info)$(sandbox_prompt)
$FG[255]╰─± '

PS2=''

RPROMPT='%!'
