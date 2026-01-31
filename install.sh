#!/bin/bash

set -e

DOTPATH="$HOME/darkpower"

# 色付き出力
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo_success() {
    echo -e "${GREEN}✓${NC} $1"
}

echo_info() {
    echo -e "${YELLOW}→${NC} $1"
}

echo_error() {
    echo -e "${RED}✗${NC} $1"
}

# OSの検出
detect_os() {
    case "$OSTYPE" in
        linux-gnu*)
            if [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
                echo "ubuntu"
            else
                echo "linux"
            fi
            ;;
        darwin*)
            echo "macos"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

OS=$(detect_os)
echo_info "Detected OS: $OS"

# Homebrewのインストール (macOS)
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo_success "Homebrew installed"
    else
        echo_success "Homebrew is already installed"
    fi
}

# curlのインストール
install_curl() {
    if ! command -v curl &> /dev/null; then
        echo_info "Installing curl..."
        case $OS in
            ubuntu)
                sudo apt-get update
                sudo apt-get install -y curl
                ;;
            macos)
                # macOSには通常curlが入っている
                echo_info "curl should be pre-installed on macOS"
                ;;
        esac
        echo_success "curl installed"
    else
        echo_success "curl is already installed"
    fi
}

# build-essentialのインストール (Ubuntu only)
install_build_essential() {
    if [ "$OS" = "ubuntu" ]; then
        if ! dpkg -l | grep -q build-essential; then
            echo_info "Installing build-essential..."
            sudo apt-get update
            sudo apt-get install -y build-essential
            echo_success "build-essential installed"
        else
            echo_success "build-essential is already installed"
        fi
    fi
}

# zshのインストール
install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo_info "Installing zsh..."
        case $OS in
            ubuntu)
                sudo apt-get update
                sudo apt-get install -y zsh
                ;;
            macos)
                brew install zsh
                ;;
        esac
        echo_success "zsh installed"
    else
        echo_success "zsh is already installed"
    fi
}

# tmuxのインストール
install_tmux() {
    if ! command -v tmux &> /dev/null; then
        echo_info "Installing tmux..."
        case $OS in
            ubuntu)
                sudo apt-get update
                sudo apt-get install -y tmux
                ;;
            macos)
                brew install tmux
                ;;
        esac
        echo_success "tmux installed"
    else
        echo_success "tmux is already installed"
    fi
}

# tilixのインストール (Ubuntu only)
install_tilix() {
    if [ "$OS" = "ubuntu" ]; then
        if ! command -v tilix &> /dev/null; then
            echo_info "Installing tilix..."
            sudo apt-get update
            sudo apt-get install -y tilix
            echo_success "tilix installed"
        else
            echo_success "tilix is already installed"
        fi
    fi
}

# xclipのインストール (Ubuntu only)
install_xclip() {
    if [ "$OS" = "ubuntu" ]; then
        if ! command -v xclip &> /dev/null; then
            echo_info "Installing xclip..."
            sudo apt-get update
            sudo apt-get install -y xclip
            echo_success "xclip installed"
        else
            echo_success "xclip is already installed"
        fi
    fi
}

# oh-my-zshのインストール
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo_info "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        echo_success "oh-my-zsh installed"
    else
        echo_success "oh-my-zsh is already installed"
    fi
}

# neovimのインストール
install_nvim() {
    if ! command -v nvim &> /dev/null; then
        echo_info "Installing neovim..."
        case $OS in
            ubuntu)
                sudo apt-get update
                sudo apt-get install -y software-properties-common
                sudo add-apt-repository -y ppa:neovim-ppa/unstable
                sudo apt-get update
                sudo apt-get install -y neovim
                ;;
            macos)
                brew install neovim
                ;;
        esac
        echo_success "neovim installed"
    else
        echo_success "neovim is already installed"
    fi
}

# dockerのインストール
install_docker() {
    if ! command -v docker &> /dev/null; then
        echo_info "Installing docker..."
        case $OS in
            ubuntu)
                # Docker公式のインストール方法
                sudo apt-get update
                sudo apt-get install -y ca-certificates gnupg
                sudo install -m 0755 -d /etc/apt/keyrings
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                sudo chmod a+r /etc/apt/keyrings/docker.gpg
                echo \
                  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
                  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                sudo apt-get update
                sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                sudo usermod -aG docker $USER
                echo_success "docker installed (You may need to log out and back in for group changes to take effect)"
                ;;
            macos)
                echo_info "Please install Docker Desktop manually from https://www.docker.com/products/docker-desktop"
                ;;
        esac
    else
        echo_success "docker is already installed"
    fi
}

# nvmのインストール
install_nvm() {
    if [ ! -d "$HOME/.nvm" ]; then
        echo_info "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
        echo_success "nvm installed"
    else
        echo_success "nvm is already installed"
    fi
}

# メイン処理
echo "======================================"
echo "  DarkPower Setup Script"
echo "======================================"
echo ""

# macOSの場合、最初にHomebrewをインストール
if [ "$OS" = "macos" ]; then
    install_homebrew
fi

# 各ツールのインストール
echo ""
echo "=== Installing dependencies ==="
install_curl
install_build_essential
install_zsh
install_tmux
install_tilix
install_xclip
install_oh_my_zsh
install_nvim
install_docker
install_nvm

# dotfilesのシンボリックリンク作成
echo ""
echo "=== Setting up dotfiles ==="
for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".config" ] && ln -snfv "$DOTPATH/$f/nvim" "$HOME/$f/nvim" && echo_success "installed nvim config" && continue
  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
  echo_success "Installed $f"
done

echo ""
echo "======================================"
echo_success "Setup completed!"
echo "======================================"
echo ""
echo "Next steps:"
echo "  1. Log out and back in (for docker group changes)"
echo "  2. Run: chsh -s \$(which zsh) (to set zsh as default shell)"
echo "  3. Install Node.js: nvm install --lts"
echo ""
