# Defined in - @ line 1
function glog2 --description 'alias glog2=git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n%C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
	git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n%C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all $argv;
end
