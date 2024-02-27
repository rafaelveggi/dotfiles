source ~/dotfiles/utils.bash

function __package_management() {
    local query="${*:2}"
    case "$1" in
        "i")
            sudo xbps-install --sync $query
        ;;
        "u")
            sudo xbps-install --sync --update --verbose --verbose
        ;;
        "s")
            xbps-query --search $query
        ;;
        "f")
            xbps-query --fulldeptree $query
        ;;
        "q")
            xbps-query --repository --regex --search $query
        ;;
        "r")
            sudo xbps-remove --recursive --clean-cache --remove-orphans $query
        ;;
        *)
            echo -e "Invalid operation. Use:"
            echo -e "i - install <pkg>"
            echo -e "r - remove <pkg>"
            echo -e "q - search <regexp>"
            echo -e "u - update"
    esac
}

alias p="__package_management "
