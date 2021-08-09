set -x PATH $PATH $HOME/.local/bin $HOME/go/bin
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

# Configuration for fish shell in emacs
if test -n "$INSIDE_EMACS"
	set -x TERM eterm-color
end

