#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
 

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"


# Sourcing dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/.{functions,function_*,path,env,alias,completion,grep,prompt,nvm,rvm,custom}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done
