export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _club_house_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
}

function _club_house_get_dir_abbr() {
  local d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

function _club_house_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo "%F{3}git:(%F{2}${b}%F{3}) "
}

PROMPT='%# $(_club_house_get_venv)%(?..%F{2}*%? )%F{4}\
$(_club_house_get_dir_abbr) $(_club_house_get_branch)%F{1}󱢟 %f '
