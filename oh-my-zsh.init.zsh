#!/usr/bin/zsh

pushd ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .oh-my-zsh .config/oh-my-zsh
rm .zshrc
echo export ZDOTDIR="$HOME/.config/zsh" | sudo tee /etc/zsh/zshenv
popd
stow oh-my-zsh
cd ~/.config/oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
