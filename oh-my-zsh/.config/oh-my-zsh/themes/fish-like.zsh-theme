# Fish like prompt

function rootRed() {
	if [[ $(whoami) == "root" ]]; then
		echo "%{$fg_bold[red]%}"
	else
		echo "%{$fg_bold[blue]%}"
	fi
}

function getPWD() {
	local dir=$PWD
	declare -a dirarr
	local k=0
	for (( i=0; i<${#dir}; i++ )); do
		local char="${dir:$i:1}"

		if [[ $char == "/" ]]; then
			k=$(($k+1))
		else
			dirarr[k]="${dirarr[k]}$char"
		fi
	done

	local start=0
	if [[ ${dirarr[1]} == "home" && ${dirarr[2]} == $(whoami) ]]; then
		echo -n "~/"
		start=3
	fi

	for (( ; start<${#dirarr}; start++ )); do
		local firstchar="${dirarr[start]:0:1}"
		if [[ $firstchar == "." ]]; then
			echo -n "${dirarr[start]:0:2}" # . and second character
		else
			echo -n $firstchar
		fi
		echo -n "/"
	done

	echo -n "${dirarr[start]}"

	if [[ ${#dirarr} == 0 ]]; then
		echo -n "/"
	fi

	#for folder in "${dirarr[@]}"; do
	#	echo -n "$folder"
	#	echo -n "/"
	#done
}

local retcode="%(?.%{$fg_bold[green]%}(%?.%{$fg_bold[red]%}(%?))"

#function retcode() {
#	echo "%(?.$fg_bold[green](%?.$fg_bold[red](%?))"
#}

function gitShowBranch() {
	git branch &>/dev/null && echo " %{$fg_bold[yellow]%}$(git branch 2>/dev/null | grep '*' | cut -d' ' -f2)"
}

setopt PROMPT_SUBST
PROMPT='$(rootRed)%n%{$fg_bold[yellow]%}@%{$fg_bold[cyan]%}%M %{$fg_bold[green]%}%{$fg_bold[yellow]%}$(getPWD) $retcode$(gitShowBranch)%{$fg_bold[magenta]%}>%{$reset_color%} '
