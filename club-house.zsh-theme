setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Club_House()
{
	Get_Virtual_Environment()
	{
		typeset -r v=${VIRTUAL_ENV##*/}
		[[ -n $v ]] && echo "($v) "
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
		[[ -n $b ]] && echo "%F{3}git:(%F{2}$b%F{3}) "
	}

	echo "%# $(Get_Virtual_Environment)%(?..%F{2}*%? )%F{4}$(Get_Directory)"\
	     "$(Get_Branch)%F{1}󱢟 %f "
}

PROMPT='$(__Club_House)'
