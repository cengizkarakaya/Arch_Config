# Arch Linux Dotfiles


Cengiz'in Arch Linux + Hyprland yapılandırması.

## Yönetilen kullanıcı ayarları

- Alacritty
- Bash
- Fuzzel
- Helix
- Hyprland
- Hypridle
- Hyprlock
- Mako
- MIME associations
- Readline
- Starship
- Thunar
- Waybar
- Yazi
- Zellij
- User scripts

## Host

Ana laptop:

`archlaptop`

Makineye özel paket listeleri:

- `packages/hosts/archlaptop/all-explicit.txt`
- `packages/hosts/archlaptop/all-foreign.txt`

Makineye özel sistem ayarları:

`hosts/archlaptop/`

Bu dosyalar `/etc` veya `/boot` üzerine otomatik kopyalanmaz.

## Yeni Arch kurulumunda

Önce Git:

```bash
sudo pacman -Syu --needed git
