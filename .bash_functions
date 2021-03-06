# Extract archives of various types
function extract() {
    if [ -f $1 ] ; then
        local dir_name=${1%.*}  # Filename without extension
        case $1 in
            *.tar.bz2)  tar xjf           $1 ;;
            *.tar.gz)   tar xzf           $1 ;;
            *.tar.xz)   tar Jxvf          $1 ;;
            *.tar)      tar xf            $1 ;;
            *.tbz2)     tar xjf           $1 ;;
            *.tgz)      tar xzf           $1 ;;
            *.bz2)      bunzip2           $1 ;;
            *.rar)      unrar x           $1 $2 ;;
            *.gz)       gunzip            $1 ;;
            *.zip)      unzip -d$dir_name $1 ;;
            *.Z)        uncompress        $1 ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo
}


# cd into whatever is the forefront Finder window.
function cdf() {
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}


# Print cyan underlined header 
function header() {
    echo -e "$UNDERLINE$CYAN$1$NOCOLOR"
}

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}
