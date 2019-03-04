set -x PATH $PATH $HOME/.local/bin $HOME/go/bin
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
