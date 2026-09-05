#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# ---------------------------------------------------------
# Modern CLI tools
# ---------------------------------------------------------

# eza - modern ls
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --group-directories-first --git'
alias la='eza -a --icons=auto --group-directories-first'
alias tree='eza --tree --icons=auto --group-directories-first'
alias lt='eza --tree --level=2 --icons=auto --group-directories-first'

# zoxide - smarter cd
eval "$(zoxide init bash)"
