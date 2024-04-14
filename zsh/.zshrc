# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
zinit light https://github.com/ael-code/zsh-colored-man-pages
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/clipboard.zsh
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/copybuffer/copybuffer.plugin.zsh
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/asdf/asdf.plugin.zsh
zinit load zsh-users/zsh-autosuggestions
# zinit load agkozak/zsh-z
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search
zinit light zsh-users/zsh-completions
# enable the zsh-completions plugins
autoload -U compinit; compinit
# makes it case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# personal .env file
source ~/.env_.sh
export SCRIPTS_DIR="$HOME/scripts"
# lsd color for directories
# export LS_COLORS="di=34"

export EDITOR=/usr/bin/nvim
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
SUDO_EDITOR=/usr/bin/nvim
export SUDO_EDITOR

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
PATH="$PATH:~/.dotnet/tools"

# PATH=$PATH:~/bin
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

alias ls="lsd"
alias screenoff="sleep 1; xset dpms force off"
alias cpy="xclip -sel clip"
# gum
alias run="$HOME/scripts/run.sh"
alias change-theme="$HOME/scripts/alacritty-change-theme.lua"
# kitty ssh
# alias ssh-k="kitty +kitten ssh" # --kitten=color_scheme=Alucarda"
alias cat="bat"
alias wiki="cd ~/Drive/obsidian/Wiki && nvim ."
# alias lazy="lazygit"
alias tmx="tmuxinator"

# enable <C-BS> for file paths
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
RANGER_LOAD_DEFAULT_RC=false

setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# direnv
eval "$(direnv hook zsh)"
# zoxide
eval "$(zoxide init zsh)"
