# =========================================================
#  ALIASES - Quick Commands & Shortcuts
# =========================================================

# -- Navigation --
alias home='cd ~'
alias dev='cd ~/dev'
alias personal='cd ~/personal'
alias alesko='cd ~/alesko'
alias dotfiles='cd ~/dotfiles'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# -- Config shortcuts --
alias zshconfig='nvim ~/.zshrc'
alias zshreload='source ~/.zshrc'
alias aliasconfig='nvim ~/dotfiles/.config/zsh/aliases.zsh'
alias funcconfig='nvim ~/dotfiles/.config/zsh/functions.zsh'
alias ghosttyconfig='nvim ~/.config/ghostty/config'
alias gitconfig='nvim ~/dotfiles/gitconfig'

# -- Editor shortcuts --
alias vim='nvim'
alias vi='nvim'

# -- Better defaults --
alias ls='ls -la --color=auto'
alias l='ls -la'
alias la='ls -la'
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# -- Git shortcuts --
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --oneline --graph --decorate --all'

# -- Homebrew --
alias brewup='brew update && brew upgrade'
alias brewclean='brew cleanup'
alias brewcheck='brew doctor'

# -- Useful --
alias cpwd='pwd | pbcopy'
alias mkdirp='mkdir -p'
alias cls='clear'

# -- Opencode --
alias opencode='~/.opencode/opencode-macos-arm64'
