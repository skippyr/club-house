setopt promptsubst;

export VIRTUAL_ENV_DISABLE_PROMPT=1;

_club_house_write_git_dirty_status_module() {
  [[ $(git status -s 2>/dev/null) ]] && echo "*";
}

_club_house_write_git_module() {
  branch=$(git branch --show-current 2>/dev/null);
  [[ ${branch} ]] &&
      echo "%F{yellow}git:(%F{red}${branch}$(_club_house_write_git_dirty_status_module)%F{yellow}) ";
}

_club_house_write_path_module() {
  path_splits=("${(s./.)PWD/${HOME}/~}");
  [[ ${#path_splits} -gt 1 ]] &&
      for index in {1..$((${#path_splits} - 1))};
      do
        [[ ${path_splits[index]} == .* ]] &&
            path_splits[index]=${path_splits[index][1,2]} ||
            path_splits[index]=${path_splits[index][1]};
      done
  echo ${(j./.)path_splits};
}

_club_house_write_virtual_env_module() {
  [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) ";
}

PROMPT='%# $(_club_house_write_virtual_env_module)%(?..%F{red}*%? )%F{blue}\
$(_club_house_write_path_module) $(_club_house_write_git_module)%F{red}󱢟 %f ';
