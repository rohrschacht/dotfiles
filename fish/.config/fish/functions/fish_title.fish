# Defined in - @ line 2
function fish_title
	if test -n "$INSIDE_EMACS"
        true
    else
        if [ (fish --version | cut -d' ' -f 3 | cut -d'.' -f 1) -lt 3 ]
            echo fish (__fish_pwd)
        else
            echo (status current-command) (__fish_pwd)
        end
    end
end
