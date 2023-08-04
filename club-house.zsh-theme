setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

_club_house() {
  get_virtual_environment() {
    [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
  }

  get_directory() {
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
      for directory_split_index in {1..$((${#directory_splits} - 1))}; do
        [[ "${directory_splits[directory_split_index]}" == .* ]] &&
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
      done
    echo ${(j./.)directory_splits}
  }

  get_branch() {
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo "%F{3}git:(%F{2}${branch}%F{3}) "
  }

  echo\
    "%# $(get_virtual_environment)%(?..%F{2}*%? )%F{4}$(get_directory)"\
    "$(get_branch)%F{1}󱢟 %f "
}

PROMPT='$(_club_house)'
