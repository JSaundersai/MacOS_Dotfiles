#!/bin/zsh

# =========================================================
#  JARED'S MACOS DEV SETUP SCRIPT
#  One command to rule them all
# =========================================================

set -e

echo "======================================================"
echo "  🚀 Jared's macOS Development Environment Setup"
echo "======================================================"
echo ""

# -- Check for Xcode CLI Tools --
if ! xcode-select -p &> /dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please complete the Xcode CLI installation and re-run this script"
    exit 1
else
    echo "✅ Xcode CLI Tools already installed"
fi

# -- Install Homebrew --
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed"
fi

# -- Update Homebrew --
echo "🔄 Updating Homebrew..."
brew update

# -- Disable Homebrew Analytics --
brew analytics off

# -- Install Essential Formulae --
echo "📦 Installing essential packages..."

# Core tools
brew install git
brew install gh
brew install stow
brew install neovim
brew install starship
brew install tmux

# Zsh enhancements
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-vi-mode

# Developer tools
brew install node
brew install nvm
brew install pyenv
brew install fzf
brew install ripgrep
brew install fd
brew install bat
brew install eza
brew install btop

# Fonts
echo "🔤 Installing fonts..."
brew install --cask font-jetbrains-mono
brew install --cask font-jetbrains-mono-nerd-font

# -- Install Casks --
echo "💻 Installing applications..."
brew install --cask ghostty

# -- Install Oh My Zsh --
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "🐚 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ Oh My Zsh already installed"
fi

# -- Create Project Directories --
echo "📁 Creating project directories..."
mkdir -p "$HOME/dev"
mkdir -p "$HOME/personal"
mkdir -p "$HOME/alesko"

# -- Setup Dotfiles --
echo "🔗 Setting up dotfiles..."
if [[ ! -d "$HOME/dotfiles" ]]; then
    echo "Cloning dotfiles repository..."
    # Note: Update this with your actual repo URL
    git clone https://github.com/jared/dotfiles.git "$HOME/dotfiles" 2>/dev/null || echo "Please manually clone your dotfiles repo"
else
    cd "$HOME/dotfiles"
    
    # Stow the configs
    echo "Creating symlinks with stow..."
    if [[ -d ".config" ]]; then
        stow -v -t ~/.config .config
    fi
    
    # Link zshrc
    if [[ -f ".zshrc" ]]; then
        ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
    fi
    
    # Link gitconfig
    if [[ -f "gitconfig" ]]; then
        ln -sf "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
    fi
fi

# -- Configure Git --
echo "⚙️  Configuring Git..."
if ! git config --global user.name &> /dev/null; then
    git config --global user.name "Jared"
    git config --global user.email "Jared@alesko.ai"
fi

# -- Setup GitHub CLI --
echo "🔐 Checking GitHub CLI authentication..."
if ! gh auth status &> /dev/null; then
    echo "Please run 'gh auth login' to authenticate with GitHub"
fi

# -- Setup Starship --
echo "⭐ Configuring Starship prompt..."
if ! grep -q "starship init zsh" "$HOME/.zshrc" 2>/dev/null; then
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi

# -- Setup fzf --
if command -v fzf &> /dev/null && [[ ! -f "$HOME/.fzf.zsh" ]]; then
    echo "🔍 Setting up fzf..."
    $(brew --prefix)/opt/fzf/install --all
fi

# -- Final Instructions --
echo ""
echo "======================================================"
echo "  ✅ Setup Complete!"
echo "======================================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Run 'gh auth login' if you haven't already"
echo "  3. Start using Ghostty: ghostty or Cmd+Space -> Ghostty"
echo "  4. Your projects go in: ~/dev, ~/personal, ~/alesko"
echo ""
echo "Useful commands:"
echo "  dot_push    - Push dotfiles changes"
echo "  zshreload   - Reload zsh configuration"
echo "  goproj      - Quick project navigation"
echo ""
