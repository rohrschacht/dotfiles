function ssh
	command ssh $argv 'which fish >/dev/null 2>&1 && which git >/dev/null 2>&1 && which stow >/dev/null 2>&1 || exit 1 \
		&& [ -d "$HOME/.dotfiles" ] && { cd "$HOME/.dotfiles" && git pull && [ -L "$HOME/.config/fish" ] || { rm -rf "$HOME/.config/fish" && cd "$HOME/.dotfiles" && stow fish oh-my-fish && [ -d "$HOME/.local/share/omf" ] || fish -c oh-my-fish-init ; }; } \
		|| { git clone https://github.com/Rohrschacht/dotfiles.git "$HOME/.dotfiles" && cd "$HOME/.dotfiles" && stow fish oh-my-fish vim \
		 && fish -c oh-my-fish-init; }'

	if not test $status -eq 0
		echo ssh-bootstrap-config: Host does not have fish, git and stow installed or they are not in path
		command ssh -t $argv
		return
	end

	# open interactive fish with my config
	command ssh -t $argv TERM=xterm-256color fish
end
