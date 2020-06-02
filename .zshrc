export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cabal/bin/:$HOME/Code/ci/deploy:$HOME/.emacs.d/bin/

# Tmux temp directory (recoverable sessions)
TMUX_TMPDIR=$HOME/tmp/tmux

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep

# Vi mode
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# pure prompt
autoload -U promptinit; promptinit
prompt pure

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Point docker client at Minikube virtual Linux server
# if minikube status 2>&1 >/dev/null
# then
#     eval $(minikube docker-env)
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automate `use nvm ..` for directories with `.nvmrc`
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Autocomplete
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For `z`
. /usr/local/etc/profile.d/z.sh

# Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias theme_light="base16_tomorrow"
alias theme_dark="base16_oceanicnext"
alias l="ls -lah"          # Long view, show hidden
alias la="ls -AF"          # Compact view, show hidden
alias ll="ls -lFh"         # Long view, no hidden
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias httpserver="python -m SimpleHTTPServer"

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
setopt extended_glob

# Syntax highlighting in less? (Not working)
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less="less -m -N -g -i -J --underline-special --SILENT"
alias more="less"

# Screen recording using ffmpeg
alias srlist='ffmpeg -f avfoundation -list_devices true -i ""'
srstart() {
  local t="$(date +%Y-%m-%d-%H%M%S)"
  ffmpeg -f avfoundation -r 16 -i "$1" -pix_fmt yuv420p "$HOME/Desktop/screen-rec-$t.mov"
}

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi

# Syntax highlighting
source ${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
