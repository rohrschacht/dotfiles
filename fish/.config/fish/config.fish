set -x PATH $PATH $HOME/.local/bin $HOME/go/bin
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"

set -x VIMINIT "source $XDG_CONFIG_HOME/vim/.vimrc"

# Configuration for fish shell in emacs
if test -n "$INSIDE_EMACS"
	set -x TERM eterm-color
end

if command -v exa >/dev/null 2>&1
	alias ll 'exa -lg'
	alias la 'exa -lga'
else
	alias ll 'ls -lh'
	alias la 'ls -lah'
end
