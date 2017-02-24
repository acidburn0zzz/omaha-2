# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/zshCustom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history cp copyfile copydir colored-man-pages bower jira postgres repo debian systemd nyan quote extract command-not-found compleat fbterm grunt)

# User configuration

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby "ruby-2.3.3"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/sbin/chpython.sh

export ANACONDA="/home/maxr/anaconda3/bin"
export TOOLCHAIN="/home/maxr/src/dd-wrt-toolchains/toolchain-mipsel_74kc+dsp2_gcc-6.1.0_musl-1.1.15"
export REPO="/home/maxr/bin"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig/"
export OPENNI_LIBRARY="/usr/lib/libOpenNI.so"
export CL="/home/maxr/src/cellScanner2/src"
export CUDA_BIN_PATH="/opt/cuda/bin"
export MSF="/opt/metasploit-framework"
export ANDROID_HOME="/home/maxr/Android/Sdk"
export ZSH_TMUX_AUTOSTART=true
export LEIN="/home/maxr/src/leiningen/bin"
export BEEF="/home/maxr/src/beef"
export TOOLS="/home/maxr/Android/Sdk/tools"
export TOOL="/home/maxr/Android/Sdk/platform-tools"
export BTOOLS="/home/maxr/Android/Sdk/build-tools"
export JAVA_HOME="/usr/lib/jvm/java-8-jdk"
export MATLAB_JAVA="/usr/lib/jvm/java-8-jdk/jre"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/sbin:/usr/bin:/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PYENV_ROOT/bin:$PATH:$TOOLS:$TOOL:$BEEF:$LEIN:$CL:$MSF:$CUDA_BIN_PATH:$REPO:$TOOLCHAIN:$ANACONDA"
export MANPATH="/usr/local/man:$MANPATH"
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


HISTSIZE=50000
SAVEHIST=50000

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ls="ls -laht --color=auto --group-directories-first"
alias ubuOS="cp ~/lsb-release.ubu /etc/lsb-release && apt update"
alias kaliOS="cp ~/lsb-release.kali /etc/lsb-release && apt update"
alias con4class="openvpn /root/Desktop/OSCP/_connect/OS-23033-PWK.ovpn &"
alias note="nocorrect note"
alias maxr="vim /etc/nginx/sites-available/maxrobbins.conf"
alias ghost="vim /var/www/maxrobbins/config.js"
alias ts="/opt/ts/ts3client_runscript.sh &> /dev/null &"
alias wb="cd /var/www/maxrobbins"
alias vm="VBoxManage"
alias mh="cd /home/maxr/"
alias robot="cd /home/maxr/Downloads/robot"
alias copy="xclip -sel clip"
alias sqlmap="python2 /home/maxr/src/sqlmap/sqlmap.py"
alias peepdf="python2 /home/maxr/src/peepdf/peepdf.py"
alias reptar="reptyr"

eval "$(pyenv init -)"

note() {
        $EDITOR ~/notes/"$*".txt
}

notels() {
        ls -c ~/notes/ | grep "$*"
}

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
