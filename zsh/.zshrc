ZSH_THEME=""

source /usr/share/zsh/share/antigen.zsh

antigen bundle git

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-auto-notify
antigen bundle rummik/zsh-ing

antigen apply

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

#evals
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

#aliases
alias e="eza --long -all --icons --no-time"

source $ZDOTDIR/.zshalias

nitch
