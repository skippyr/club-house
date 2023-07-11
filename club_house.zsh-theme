setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _club_house::venv
{
    typeset -r venv="${VIRTUAL_ENV##*/}"
    [[ -n "${venv}" ]] && echo "(${venv}) "
}

function _club_house::pwd
{
    typeset -a pwd=("${(s./.)PWD/${HOME}/~}")
    [[ ${#pwd} > 1 ]] &&
    for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
        pwd[splits_iterator]="${pwd[splits_iterator][1,2]}" ||
        pwd[splits_iterator]="${pwd[splits_iterator][1]}"
    done
    echo "${(j./.)pwd}"
}

function _club_house::branch
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ -n ${branch} ]] && echo "%F{3}git:(%F{2}${branch}%F{3}) "
}

PROMPT='%# $(_club_house::venv)%(?..%F{2}*%? )%F{4}$(_club_house::pwd) \
$(_club_house::branch)%F{1}󱢟 %f '

