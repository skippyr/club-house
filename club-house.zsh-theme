export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Club_House__Get_Virtual_Environment()
{
    [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
}

function __Club_House__Get_Directory_Abbreviated()
{
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
        for directory_split_index in {1..$((${#directory_splits} - 1))}; do
            [[ "${directory_splits[directory_split_index]}" == .* ]] &&
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
        done
    echo ${(j./.)directory_splits}
}

function __Club_House__Get_Git_Branch()
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo "%F{3}git:(%F{2}${branch}%F{3}) "
}

PROMPT='%# $(__Club_House__Get_Virtual_Environment)%(?..%F{2}*%? )%F{4}$(__Club_House__Get_Directory_Abbreviated) $(__Club_House__Get_Git_Branch)%F{1}󱢟 %f '
