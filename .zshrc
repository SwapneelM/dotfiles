# Based on https://github.com/da-edra/dotfiles
export ZSH="$HOME/.oh-my-zsh"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_ALL=en_US.UTF-8
export TERMINAL=terminator
export PAGER=less
export VISUAL=emacs
export TERM="xterm-256color"
export GPG_TTY=$(tty)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='emacs'
fi

# Syntax highlighting and tab completion
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit

# Autocompletions for zsh commands
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Coloured man pages using less as pager
man() {
    env \
	      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	      LESS_TERMCAP_md=$(printf "\e[1;31m") \
	      LESS_TERMCAP_me=$(printf "\e[0m") \
	      LESS_TERMCAP_se=$(printf "\e[0m") \
	      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	      LESS_TERMCAP_ue=$(printf "\e[0m") \
	      LESS_TERMCAP_us=$(printf "\e[1;32m") \
	      man "$@"
}

# Aliases for a few useful commands
alias mirrorUpdate="sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias yaourt="yaourt --pager --color"
alias pacmanGhost="~/.pacman.sh"
alias shivita="toilet -f mono12 -F rainbow 'andrea' | ponythink -f winona"
alias ip="ip -c"
alias rm="rm -i"
alias x="ranger"
alias c="cmus"
alias h="htop"
# Swapneel's custom commands
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Show OS info when opening a new terminal
# requires neofetch - for osx run `brew install neofetch`
if neofetch; then                                                                    12:17  46% (2:19) 
    echo ""
    echo "Neofetch isn't installed automatically so you will have to run a manual install"
    echo "For Linux you can try"
    echo -e "\t sudo apt-get install neofetch"
    echo -e "\n"
    echo "For OS X you can try"
    echo -e "\t brew install neofetch"
    echo "For RHEL/Fedora/CentOS you can try"
    echo -e "\t sudo yum install neofetch"
    echo "For more platforms or in case of errors take a look at installation instructions"
    echo -e "\t https://github.com/dylanaraps/neofetch/wiki/Installation"
else
    echo "Neofetch failed to install"
fi

fortune softwareengineering | cowsay -f homer | lolcat

# Font mode for powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{white}%k"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{161} \uf155%f%F{white} %k\ue0b0%f "

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue231'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

# Context
DEFAULT_USER="swappy"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_LINUX_ICON='%F{cyan}\uf300 %F{white}arch%F{cyan}linux%f'

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf071'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=true

# Status
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='blue'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='green'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='yellow'

# Time
POWERLEVEL9K_TIME_FORMAT="%F{black}\uf017 %D{%I:%M}%f"
POWERLEVEL9K_TIME_BACKGROUND='yellow'

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv time battery)
