setopt promptsubst;

export VIRTUAL_ENV_DISABLE_PROMPT=1;

function _clubHouse_writeGitDirtyStatusModule()
{
	[[ $(git status -s 2>/dev/null) ]] && echo "*";
}

function _clubHouse_writeGitModule()
{
	branch=$(git branch --show-current 2>/dev/null);
	[[ ${branch} ]] &&
		echo "%F{yellow}git:(%F{red}${branch}$(_clubHouse_writeGitDirtyStatusModule)%F{yellow}) ";
}

function _clubHouse_writePathModule()
{
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

function _clubHouse_writeVirtualEnvModule()
{
	[[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) ";
}

PROMPT='%# $(_clubHouse_writeVirtualEnvModule)%(?..%F{red}*%? )%F{blue}$(_clubHouse_writePathModule) \
$(_clubHouse_writeGitModule)%F{red}󱢟 %f ';
