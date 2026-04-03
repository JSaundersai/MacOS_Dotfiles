# =========================================================
#  JARED'S ZSH CONFIGURATION
#  Powered by Oh My Zsh + Modular Configs
# =========================================================

# -- Oh My Zsh Path --
export ZSH="$HOME/.oh-my-zsh"

# -- Sourcing Modular Configs --
# Load all .zsh files from ~/.config/zsh/
for config in ~/dotfiles/.config/zsh/*.zsh(N); do
    source "$config"
done
unset config

# -- Oh My Zsh Settings --
# Theme is disabled (using Starship instead)
# ZSH_THEME="robbyrussell"

# Update frequency (14 days)
zstyle ':omz:update' frequency 14

# -- Plugins --
plugins=(
    git
    colored-man-pages
    macos
    brew
    npm
    node
    gh
)

source $ZSH/oh-my-zsh.sh

# -- External Plugins (Brew-installed) --
# Autosuggestions
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Syntax highlighting
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# VI mode
if [[ -f "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fi

# -- Starship Prompt --
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# -- FZF (if installed) --
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
fi

# -- Completion Cache --
mkdir -p "$HOME/.cache/zsh"
