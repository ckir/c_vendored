_ansifilter() {
    local IFS=$' \t\n'
    local args cur prev cmd opts arg
    args=("${COMP_WORDS[@]}")
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-i --input -o --output -O --outdir -x --max-size -t --tail -T --text -H --html -M --pango -L --latex -P --tex -R --rtf -S --svg -B --bbcode -a --anchors -d --doc-title -e --encoding -f --fragment -F --font -k --ignore-clear -c --ignore-csi -l --line-numbers -m --map -r --style-ref -s --font-size -p --plain -w --wrap --no-trailing-nl --no-version-info --wrap-no-numbers --derived-styles --art-cp437 --art-bin --art-tundra --art-width --art-height --height --width -v --version -h --help"

    case "$prev" in
        -i|--input)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -o|--output)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -O|--outdir)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -x|--max-size)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -a|--anchors)
            COMPREPLY=($(compgen -W "self" -- "$cur"))
            return 0
            ;;
        -d|--doc-title)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -e|--encoding)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -F|--font)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -k|--ignore-clear)
            COMPREPLY=($(compgen -W "0 1" -- "$cur"))
            return 0
            ;;
        -m|--map)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -r|--style-ref)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -s|--font-size)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        -w|--wrap)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        --art-width)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        --art-height)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        --height)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
        --width)
            COMPREPLY=($(compgen -f -- "$cur"))
            return 0
            ;;
    esac

    if [[ "$cur" = -* ]]; then
        COMPREPLY=($(compgen -W "$opts" -- "$cur"))
    fi
}

complete -F _ansifilter -o bashdefault -o default ansifilter
