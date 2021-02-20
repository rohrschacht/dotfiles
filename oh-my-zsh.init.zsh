#!/usr/bin/zsh

PWDSAVE=$PWD
cd $HOME
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .oh-my-zsh .config/oh-my-zsh
rm .zshrc
echo export ZDOTDIR="$HOME/.config/zsh" | sudo tee /etc/zsh/zshenv
cd $PWDSAVE
stow oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/oh-my-zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/oh-my-zsh/themes/powerlevel10k
