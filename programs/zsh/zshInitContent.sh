# [[ ! -f ${./config/p10k.zsh} ]] || source ${./config/p10k.zsh}
# [[ ! -f "$HOME/.config/p10k.zsh" ]] || source "$HOME/.config/p10k.zsh"

# https://github.com/atuinsh/atuin/issues/977#issuecomment-1548880080
zvm_after_init_commands+=(eval "$(atuin init zsh)")