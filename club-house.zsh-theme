export VIRTUAL_ENV_DISABLE_PROMPT=1;

setopt promptsubst;

function _ClubHouse_WriteGitDirtyStatusModule()
{
    [[ $(git status -s 2>/dev/null) ]] && echo "*";
}

function _ClubHouse_WriteGitModule()
{
    branch=$(git branch --show-current 2>/dev/null);
    [[ ${branch} ]] &&
        echo "%F{yellow}git:(%F{red}${branch}$(_ClubHouse_WriteGitDirtyStatusModule)%F{yellow}) ";
}

function _ClubHouse_WritePathModule()
{
    pathSplits=("${(s./.)PWD/${HOME}/~}");
    [[ ${#pathSplits} -gt 1 ]] &&
        for index in {1..$((${#pathSplits} - 1))};
        do
            [[ ${pathSplits[index]} == .* ]] &&
                pathSplits[index]=${pathSplits[index][1,2]} ||
                pathSplits[index]=${pathSplits[index][1]};
        done
    echo ${(j./.)pathSplits};
}

function _ClubHouse_WriteVirtualEnvModule()
{
    [[ ${VIRTUAL_ENV} ]] && echo "(${VIRTUAL_ENV##*/}) ";
}

PROMPT='%# $(_ClubHouse_WriteVirtualEnvModule)%(?..%F{red}*%? )%F{blue}$(_ClubHouse_WritePathModule) \
$(_ClubHouse_WriteGitModule)%F{red}󱢟 %f ';
