# =========================================================
#  EXPORTS - Environment Variables & PATH
# =========================================================

# Path configuration
path=(
    $HOME/bin
    $HOME/.local/bin
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $path
)

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Editor preferences
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi
export VISUAL="$EDITOR"

# Language environments
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Zsh performance
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"
