#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HOST="${1:-$(</etc/hostname)}"

PKG_DIR="$DOTFILES_DIR/packages/hosts/$HOST"
OFFICIAL_PKGS="$PKG_DIR/all-explicit.txt"
FOREIGN_PKGS="$PKG_DIR/all-foreign.txt"

STOW_PACKAGES=(
    alacritty
    applications
    bash
    bat
    fuzzel
    gtk
    helix
    hypr
    mako
    mimeapps
    readline
    scripts
    starship
    thunar
    waybar
    yazi
    zellij
    zathura
)

echo "==> Dotfiles: $DOTFILES_DIR"
echo "==> Host:     $HOST"
echo

if [[ ! -f "$OFFICIAL_PKGS" ]]; then
    echo "HATA: Paket listesi bulunamadı:"
    echo "  $OFFICIAL_PKGS"
    exit 1
fi

echo "==> Resmî Arch paketleri güncelleniyor/kuruluyor..."
sudo pacman -Syu --needed - < "$OFFICIAL_PKGS"

echo
echo "==> Stow paketleri kuruluyor..."

cd "$DOTFILES_DIR"

for package in "${STOW_PACKAGES[@]}"; do
    if [[ -d "$package" ]]; then
        echo "    -> $package"
        stow --restow --target="$HOME" "$package"
    fi
done

echo
echo "==> Nord masaüstü teması kuruluyor..."

if [[ -x "$HOME/.local/bin/install-nord-assets" ]]; then
    "$HOME/.local/bin/install-nord-assets"
else
    echo "    install-nord-assets bulunamadı; tema kurulumu atlandı."
fi

echo
echo "==> Yazi eklentileri ve flavor'ları kuruluyor..."

if command -v ya >/dev/null 2>&1 &&
   [[ -f "$HOME/.config/yazi/package.toml" ]]; then
    ya pkg install
else
    echo "    Yazi veya package.toml bulunamadı; bu adım atlandı."
fi

echo
echo "==> Kullanıcı dotfiles kurulumu tamamlandı."

if [[ -s "$FOREIGN_PKGS" ]]; then
    echo
    echo "==> AUR / foreign paketler otomatik kurulmadı:"
    sed 's/^/    - /' "$FOREIGN_PKGS"
    echo
    echo "Bu paketleri PKGBUILD'lerini kontrol ederek ayrıca kur."
fi

if [[ -d "$DOTFILES_DIR/hosts/$HOST" ]]; then
    echo
    echo "==> Host'a özel sistem ayarları mevcut:"
    echo "    $DOTFILES_DIR/hosts/$HOST"
    echo
    echo "Bunlar /etc veya /boot üzerine otomatik kopyalanmadı."
    echo "Yeni kurulumda UUID ve donanım farklarını kontrol ederek elle uygula."
fi

echo
echo "==> Bitti."
