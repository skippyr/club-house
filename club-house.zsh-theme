setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__clubhouse_t()
{
	Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) "
	}

	Get_Directory()
	{
		typeset -a d=("${(s./.)PWD/${HOME}/~}")
		[[ ${#d} > 1 ]] && for i in {1..$((${#d} - 1))}; do
			[[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
		done
		echo ${(j./.)d}
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ ${b} ]] && echo "%F{3}git:(%F{2}${b}%F{3}) "
	}

	echo "%# $(Get_Virtual_Environment)%(?..%F{2}*%? )%F{4}$(Get_Directory)"\
	     "$(Get_Branch)%F{1}󱢟 %f "
}

PROMPT='$(__clubhouse_t)'

