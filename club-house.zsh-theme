export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _club_house {
  function get_venv {
    [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
  }

  function get_cwd {
    d=("${(s./.)PWD/${HOME}/~}")
    [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
      [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
    done
    echo ${(j./.)d}
  }

  function stat_dirty {
    [[ $(git status -s 2>/dev/null) ]] && echo "*"
  }

  function get_branch {
    b=$(git branch --show-current 2>/dev/null)
    [[ ${b} ]] && echo "%F{3}git:(%F{1}${b}$(stat_dirty)%F{3}) "
  }

  echo "%# $(get_venv)%(?..%F{1}*%? )%F{4}$(get_cwd) $(get_branch)%F{1}󱢟 %f "
}

PROMPT='$(_club_house)'
