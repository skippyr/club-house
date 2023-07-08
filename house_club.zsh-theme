setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _house_club::venv {
  typeset -r venv="${VIRTUAL_ENV##*/}"
  [[ -n "${venv}" ]] &&
    echo "(${venv}) "
}

function _house_club::pwd {
  typeset -a pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]="${pwd[splits_iterator][1,2]}" ||
    pwd[splits_iterator]="${pwd[splits_iterator][1]}"
  done
  echo "${(j./.)pwd}"
}

function _house_club::branch {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
      echo "%F{3}git:(%F{2}${branch}%F{3}) "
}

PROMPT='%# $(_house_club::venv)%F{4}$(_house_club::pwd) $(_house_club::branch)%F{1}󱢟 %f '

