export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _clubHouse_writeVirtualEnvModule
{
    [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) ";
}

function _clubHouse_writePathModule
{
    pathSplits=("${(s./.)PWD/${HOME}/~}");
    [[ ${#pathSplits} -gt 1 ]] &&
        for index in {1..$((${#pathSplits} - 1))}; do
            [[ ${pathSplits[index]} == .* ]] &&
                pathSplits[index]=${pathSplits[index][1,2]} ||
                pathSplits[index]=${pathSplits[index][1]};
        done
    echo ${(j./.)pathSplits};
}

function _clubHouse_writeGitDirtyStatusModule
{
    [[ $(git status -s 2>/dev/null) ]] && echo "*";
}

function _clubHouse_writeGitModule
{
    branch=$(git branch --show-current 2>/dev/null);
    [[ ${branch} ]] &&
        echo "%F{yellow}git:(%F{red}${branch}$(_clubHouse_writeGitDirtyStatusModule)%F{yellow}) ";
}

PROMPT='%# $(_clubHouse_writeVirtualEnvModule)%(?..%F{red}*%? \
)%F{blue}$(_clubHouse_writePathModule) $(_clubHouse_writeGitModule)%F{red}󱢟 %f ';
