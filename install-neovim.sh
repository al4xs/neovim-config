#!/usr/bin/env bash

set -Eeuo pipefail

NVIM_VERSION="v0.11.7"
INSTALL_DIR="/opt/nvim"
SOURCE_DIR="/tmp/neovim-${NVIM_VERSION}"
BACKUP_DIR="/opt/nvim-backup-$(date +%Y%m%d-%H%M%S)"
BIN_LINK="/usr/local/bin/nvim"

log() {
  printf '\n\033[1;34m[INFO]\033[0m %s\n' "$1"
}

success() {
  printf '\n\033[1;32m[OK]\033[0m %s\n' "$1"
}

error() {
  printf '\n\033[1;31m[ERRO]\033[0m %s\n' "$1" >&2
}

cleanup_on_error() {
  error "A instalação falhou na linha $1."
  error "A instalação anterior não foi removida, a menos que o backup já tenha sido criado."
}

trap 'cleanup_on_error "$LINENO"' ERR

if [[ "$(uname -s)" != "Linux" ]]; then
  error "Este script foi preparado para Linux."
  exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
  error "Este script usa apt-get e foi preparado para Debian, Ubuntu ou derivados."
  exit 1
fi

log "Versão da glibc instalada:"
ldd --version | head -n 1 || true

log "Atualizando a lista de pacotes..."
sudo apt-get update

log "Instalando dependências de compilação..."
sudo apt-get install -y \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl \
  build-essential \
  git

log "Removendo apenas uma pasta temporária antiga da compilação..."
rm -rf -- "$SOURCE_DIR"

log "Baixando o código-fonte do Neovim ${NVIM_VERSION}..."
git clone \
  --branch "$NVIM_VERSION" \
  --depth 1 \
  https://github.com/neovim/neovim.git \
  "$SOURCE_DIR"

log "Compilando o Neovim..."
cd "$SOURCE_DIR"

make \
  CMAKE_BUILD_TYPE=Release \
  CMAKE_INSTALL_PREFIX="$INSTALL_DIR"

log "A compilação terminou. Preparando a instalação..."

if [[ -d "$INSTALL_DIR" ]]; then
  log "Criando backup da instalação atual em:"
  printf '%s\n' "$BACKUP_DIR"
  sudo mv "$INSTALL_DIR" "$BACKUP_DIR"
fi

log "Instalando o Neovim em ${INSTALL_DIR}..."
sudo make install

if [[ ! -x "$INSTALL_DIR/bin/nvim" ]]; then
  error "O executável não foi encontrado em ${INSTALL_DIR}/bin/nvim."

  if [[ -d "$BACKUP_DIR" && ! -d "$INSTALL_DIR" ]]; then
    log "Restaurando automaticamente o backup..."
    sudo mv "$BACKUP_DIR" "$INSTALL_DIR"
  fi

  exit 1
fi

log "Criando o link ${BIN_LINK}..."
sudo ln -sfn "$INSTALL_DIR/bin/nvim" "$BIN_LINK"

hash -r 2>/dev/null || true

log "Validando a instalação..."
"$INSTALL_DIR/bin/nvim" --version | head -n 3

success "Neovim ${NVIM_VERSION} instalado com sucesso."

printf '\nConfiguração preservada em:\n'
printf '  %s\n' "$HOME/.config/nvim"

if [[ -d "$BACKUP_DIR" ]]; then
  printf '\nBackup da instalação anterior:\n'
  printf '  %s\n' "$BACKUP_DIR"
fi

printf '\nAbra com:\n'
printf '  nvim\n'
