setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Club_House()
{
	Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
	}

	Get_Directory()
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

	Get_Branch()
	{
		typeset -r branch=$(git branch --show-current 2>/dev/null)
		[[ ${branch} ]] && echo "%F{3}git:(%F{2}${branch}%F{3}) "
	}

	echo\
		"%# $(Get_Virtual_Environment)%(?..%F{2}*%? )%F{4}$(Get_Directory)"\
		"$(Get_Branch)%F{1}󱢟 %f "
}

PROMPT='$(__Club_House)'
