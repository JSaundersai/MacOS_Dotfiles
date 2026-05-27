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

# -- Eza (modern ls) --
export EZA_ICONS_AUTO=1
export EZA_COLORS="di=1;34:da=1;34:ln=1;36:mp=1;33:ex=1;32"

# -- Bat (syntax highlighting) - Tokyo Night theme --
export BAT_THEME="TwoDark"
export BAT_STYLE="numbers,changes,header"
export PAGER="less -RF"

# -- Node.js / NVM --
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# -- Python / Pyenv (managed by UV primarily) --
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# -- UV (Fast Python Package Manager) --
export UV_PYTHON=3.14                    # Default Python version for UV
export UV_PYTHON_PREFERENCE=only-system  # Prefer system Python
export UV_LINK_MODE=copy                 # Copy instead of symlink (better for Docker)

# UV tool directory (for uvx)
export PATH="$HOME/.local/bin:$PATH"

# -- Docker --
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# -- AWS --
export AWS_PAGER=""

# -- GitHub --
export GITHUB_PERSONAL_ACCESS_TOKEN=$(gh auth token)


# -- Python Development --
export PYTHONDONTWRITEBYTECODE=1
