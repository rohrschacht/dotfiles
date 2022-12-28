#!/usr/bin/zsh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

PWDSAVE=$PWD
cd $HOME

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [[ -d $HOME/.oh-my-zsh ]]
then
	mv $HOME/.oh-my-zsh $XDG_CONFIG_HOME/oh-my-zsh
fi

rm .zshrc

if [[ -f /etc/zsh/zshenv ]] && ! grep "ZDOTDIR=" /etc/zsh/zshenv
then
	echo export ZDOTDIR="$HOME/.config/zsh" | sudo tee -a /etc/zsh/zshenv
fi
if [[ -f /etc/zshenv ]] && ! grep "ZDOTDIR=" /etc/zshenv
then
	echo export ZDOTDIR="$HOME/.config/zsh" | sudo tee -a /etc/zshenv
fi

cd $PWDSAVE
mkdir -p ~/.local/share/zsh
mkdir -p ~/.config/zsh

stow oh-my-zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/oh-my-zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/oh-my-zsh/plugins/zsh-syntax-highlighting
