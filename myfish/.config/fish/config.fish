set -x PATH $PATH $HOME/.local/bin $HOME/go/bin
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

# Configuration for fish shell in emacs
if test -n "$INSIDE_EMACS"
	set -x TERM eterm-color
end

function fish_title
	if test -n "$INSIDE_EMACS"
		true
	else
		echo (status current-command) (__fish_pwd)
	end
end
