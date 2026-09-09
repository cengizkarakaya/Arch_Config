# Arch Linux Dotfiles


Cengiz'in Arch Linux + Hyprland yapılandırması.

## Yönetilen kullanıcı ayarları

- Alacritty
- Bash
- Bat
- GTK
- Zathura
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
- Nord Masaüstü tema bileşenleri

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
git clone https://github.com/cengizkarakaya/Arch_Config.git ~/dotfiles
cd ~/dotfiles

```bash
sudo pacman -Syu --needed git

Kullanıcı paketlerini, dotfiles bağlantılarını ve Nord tema bileşenlerini kur:
./bootstrap.sh

Host'a özel sistem ayarlarını önce dry-run ile kontrol et:
restore-host

Çıktıyı kontrol ettikten sonra uygula:
restore-host --apply
