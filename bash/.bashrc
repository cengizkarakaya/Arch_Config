#
# ~/.bashrc
#

# Interactive shell değilse çık
[[ $- != *i* ]] && return


# ---------------------------------------------------------
# Basic
# ---------------------------------------------------------

alias grep='grep --color=auto'

export EDITOR="hx"
export VISUAL="hx"
export SUDO_EDITOR="hx"

# Kullanıcı komutları
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------
# Bash history
# ---------------------------------------------------------

# Daha uzun history
HISTSIZE=10000
HISTFILESIZE=20000

# Aynı komutların tekrarını temizle,
# başında boşluk olan komutları history'ye yazma
HISTCONTROL="erasedups:ignorespace"

# Çok satırlı komutları tek history girdisi olarak sakla
shopt -s cmdhist

# Terminal kapanınca history'nin üzerine yazmak yerine ekle
shopt -s histappend

# history komutunda tarih/saat göster
HISTTIMEFORMAT='%F %T '

# ---------------------------------------------------------
# eza - modern ls
# ---------------------------------------------------------

alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --group-directories-first --git'
alias la='eza -a --icons=auto --group-directories-first'
alias lt='eza --tree --level=2 --icons=auto --group-directories-first'
alias tree='eza --tree --icons=auto --group-directories-first'


# ---------------------------------------------------------
# zoxide - smarter cd
# ---------------------------------------------------------

eval "$(zoxide init bash)"


# ---------------------------------------------------------
# fzf - fuzzy finder
# ---------------------------------------------------------

eval "$(fzf --bash)"


# ---------------------------------------------------------
# Yazi
# ---------------------------------------------------------

function y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

    env -u HYPRLAND_INSTANCE_SIGNATURE \
        yazi "$@" --cwd-file="$tmp"

    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true

    command rm -f -- "$tmp"
}

function yc() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

    env -u HYPRLAND_INSTANCE_SIGNATURE \
        yazi "$@" --cwd-file="$tmp"

    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true

    command rm -f -- "$tmp"
}

# ---------------------------------------------------------
# Starship prompt
# ---------------------------------------------------------

eval "$(starship init bash)"
alias hx='helix'
