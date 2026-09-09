# Arch Linux Dotfiles

Cengiz'in Arch Linux + Hyprland yapılandırması.

## Yönetilen kullanıcı ayarları

- Alacritty
- Bash
- Bat
- Bottom
- Fastfetch
- Fuzzel
- GTK
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
- Zathura
- Zellij
- User scripts
- Nord masaüstü tema bileşenleri

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

Önce Git'i kur:

```bash
sudo pacman -Syu --needed git
```

Repository'yi klonla:

```bash
git clone https://github.com/cengizkarakaya/Arch_Config.git ~/dotfiles
cd ~/dotfiles
```

Kullanıcı paketlerini, dotfiles bağlantılarını ve Nord tema bileşenlerini kur:

```bash
./bootstrap.sh
```

Host'a özel sistem ayarlarını önce dry-run ile kontrol et:

```bash
restore-host
```

Çıktıyı kontrol ettikten sonra uygula:

```bash
restore-host --apply
```

`restore-host`, `/etc/fstab` ve systemd-boot girişlerini kritik dosyalar olarak ayrı tutar ve bunların kurulması için ikinci onay ister.

Sistem servisleri özellikle yeniden başlatılmaz. Gerekli sistem ayarları sonraki yeniden başlatmada tam olarak devreye girer.

## Manuel uygulama ayarları

Bazı uygulama tercihleri uygulamanın kendi profilinde tutulduğu için Stow ile yönetilmez.

### Brave

Brave'de:

**Settings → Appearance → Use GTK**

seçeneğini etkinleştir.

Böylece Brave arayüzü sistemdeki Nordic GTK temasıyla uyumlu görünür.

## Nord görünümü

Temel renk paletinin özel arka planı:

`#20242C`

Sistem genelinde kullanılan ana bileşenler:

- GTK theme: `Nordic`
- Icon theme: `Nordzy-dark`
- XCursor: `Nordzy-cursors-white`
- Hyprcursor: `Nordzy-hyprcursors-white`
- UI font: `FiraCode Nerd Font 10`
- Monospace font: `FiraCode Nerd Font Mono`
- Terminal background: `#20242C`

Nord görünümü Alacritty, Helix, Zellij, Waybar, Mako, Hyprlock, Hyprland, Fuzzel, GTK/Thunar, Starship, fzf, Bat, Zathura, Bottom, Fastfetch ve Linux VT/greetd tarafında uygulanır.
