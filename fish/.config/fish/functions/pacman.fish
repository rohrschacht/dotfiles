# Defined in - @ line 2
function pacman
	if test $argv[1] = "--depclean"
        sudo pacman -Rns (pacman -Qtdq)
    else if test $argv[1] = "--browse-installed"
        pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
    else if test $argv[1] = "--browse-explicitly-installed"
        pacman -Qqe | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
    else if test $argv[1] = "-Ss"
        pacsearch $argv[2..-1]
    else
        sudo pacman $argv
    end
end
