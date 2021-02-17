# ssh-bootstrap-config
# Autodeploys Rohrschacht config from github on a ssh host

function ssh-bootstrap-config() {
	# check if zsh, git and stow exist on host
	# if not, inform the user and open default shell on host
	# if they do:
	# checkout repo if it does not exist. also deploy zsh and vim configs. otherwise try to update the repo.
	command ssh "$@" 'which zsh 2>&1 >/dev/null && which git 2>&1 >/dev/null && which stow 2>&1 >/dev/null || exit 1 \
		&& [ -d "$HOME/.dotfiles" ] && { cd "$HOME/.dotfiles" && git pull; } || { git clone https://github.com/Rohrschacht/dotfiles.git "$HOME/.dotfiles" && cd "$HOME/.dotfiles" && zsh oh-my-zsh.init.zsh && stow vim; }' \
		|| { echo ssh-bootstrap-config: Host does not have zsh, git and stow installed or they are not in path; command ssh -t "$@"; return; }

	# open interactive zsh with my config
	command ssh -t "$@" ZDOTDIR='$HOME/.config/zsh' TERM=xterm-256color zsh
}

