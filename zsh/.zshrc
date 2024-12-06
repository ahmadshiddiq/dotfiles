# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/bin

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

source $ZSH/oh-my-zsh.sh

# Global Climate
function gcli_register() {
  repopath=$(git rev-parse --show-toplevel)
  if [ -z "$repopath" ]; then
    echo ""
  else
    echo "Global Climate Repository at: $repopath"
    echo $repopath > "$HOME/.gcli"
  fi
}
function gcli_install() {
  repopath=""
  if [ -e "$HOME/.gcli" ] ; then
    repopath=$(cat "$HOME/.gcli")
  fi
  if [ -z "$repopath" ]; then
    gcli_register
    echo "If GCLI_PATH environment variable is set to Global Climate repository directory, then please run this command again!"
  else
    cwd=$PWD
    cd "$repopath/cli"
    npm i
    cd "$cwd"
  fi
}
function gcli() {
  repopath=""
  if [ -e "$HOME/.gcli" ] ; then
    repopath=$(cat "$HOME/.gcli")
  fi
  if [ -z "$repopath" ]; then
    gcli_register
    echo "If GCLI_PATH environment variable is set to Global Climate repository directory, then please run gcli_install!"
  else
    cwd=$PWD
    cd "$repopath/cli"
    npm start -- "$@"
    cd "$cwd"
  fi
}

# bun
[ -s "/Users/ahmadshiddiqamin/.bun/_bun" ] && source "/Users/ahmadshiddiqamin/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end

# pnpm
export PNPM_HOME="/Users/ahmadshiddiqamin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gcbc="gcli branch create"
alias rz="source ~/.zshrc"
alias mci="mvn clean install -DskipTests"
alias gcmci="cd ~/Developer/code/gc/backend && mvn clean install -DskipTests"
alias tenv="node ~/Developer/script/toggle-env.js"
alias twc="node ~/Developer/script/toggl-csv-wrap.js"
alias n="nvim"
alias tat="tmux attach -t"
alias gc="cd ~/Developer/code/gc"

alias next-csrd="cd ~/Developer/code/gc/fe && yarn csrd dev"
alias next-public="cd ~/Developer/code/gc/fe && yarn public dev"
alias react-csrd="cd ~/Developer/code/gc/react-frontend && pnpm dev-csrd"
alias react-lksg="cd ~/Developer/code/gc/react-frontend && pnpm dev-lksg"
alias vue-admin="cd ~/Developer/code/gc/frontend && npm run admin:serve"
alias vue-all="cd ~/Developer/code/gc/frontend && npm run serve"
alias vue-app="cd ~/Developer/code/gc/frontend && npm run app:serve"

alias backend-gateway="cd ~/Developer/code/gc/backend && mvn spring-boot:run -D"spring-boot.run.profiles=local" -pl gateway"
alias backend-iam="cd ~/Developer/code/gc/backend && mvn spring-boot:run -D"spring-boot.run.profiles=local" -pl iam/iam-service"
alias backend-csrd="cd ~/Developer/code/gc/backend && mvn spring-boot:run -D"spring-boot.run.profiles=local" -pl csrd/csrd-service"

# env
export EDITOR=nvim
export REACT_EDITOR=nvim

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
