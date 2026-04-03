# =========================================================
#  FUNCTIONS - Helper Functions
# =========================================================

# -- Dotfiles Management --
dot_push() {
    cd "$HOME/dotfiles"
    git add .
    local msg="$*"
    if [[ -z "$msg" ]]; then
        msg="Dotfiles sync $(date +%d-%h-%Y_%H-%M-%S)"
    fi
    git commit -m "$msg"
    git push
    cd - > /dev/null
}

# -- Quick Project Navigation --
goproj() {
    if [[ -z "$1" ]]; then
        echo "Usage: goproj <project-name>"
        return 1
    fi
    cd "$HOME/dev/$1" 2>/dev/null || cd "$HOME/personal/$1" 2>/dev/null || cd "$HOME/alesko/$1" 2>/dev/null || echo "Project not found in dev/, personal/, or alesko/"
}

# -- Make Directory and Enter --
mkd() {
    mkdir -p "$1" && cd "$1"
}

# -- Extract Archives --
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "Cannot extract: '$1' - unknown archive format" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -- Create React Project --
newreact() {
    if [[ -z "$1" ]]; then
        echo "Usage: newreact <project-name>"
        return 1
    fi
    local proj_dir="$HOME/dev/$1"
    mkd "$proj_dir"
    echo "Creating React project: $1"
    npm create vite@latest "$1" -- --template react
    cd "$1"
    npm install
    echo "✓ Project created at $proj_dir"
}

# -- Find and Replace in Files --
replace() {
    if [[ $# -lt 3 ]]; then
        echo "Usage: replace <search> <replace> <file-pattern>"
        return 1
    fi
    local search="$1"
    local replace="$2"
    shift 2
    for file in "$@"; do
        if [[ -f "$file" ]]; then
            sed -i '' "s/$search/$replace/g" "$file"
            echo "Updated: $file"
        fi
    done
}

# -- Empty Downloads --
empty_downloads() {
    local count=$(find ~/Downloads -maxdepth 1 -type f | wc -l)
    if [[ $count -gt 0 ]]; then
        read "?Delete $count files from Downloads? (y/n) " confirm
        if [[ $confirm == [yY] ]]; then
            rm ~/Downloads/* 2>/dev/null
            echo "Downloads cleared"
        fi
    else
        echo "Downloads is already empty"
    fi
}
