# Catharsis
alias fucking='sudo'

#Quick APT
alias want='sudo aptitude install'
alias dnw='sudo aptitude remove'
alias acs='apt-cache search'
alias wat='apt-cache show'
alias purge="sudo apt-get --purge remove"
alias update="sudo apt-get update"
alias upgrade="sudo aptitude dist-upgrade"
alias clean="sudo apt-get autoremove && sudo apt-get clean"

#SSH
alias sshx="ssh -X"
alias sshsocks="ssh -D 1080 -Nf"

# CD stuff
alias burniso='cdrecord -v dev=/dev/cdrom'
alias clonecd='readom -clone -dev=/dev/scd0 -f'

# enable color
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -h --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias grip='grep --color=auto -i'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Some more ls aliases
alias ll='ls -lh --color=auto'
alias la='ls -Ah --color=auto'
alias l='ls -CFh --color=auto'

alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

alias emacs='emacs -nw'
alias :e='vim'
alias mail='mailx'

alias kvm='kvm --alt-grab'
alias qemu='qemu --alt-grab'

HttpCode(){ read a ret c < <(echo $'HEAD / HTTP/1.0\n\n' | nc "$1" 80 | head -1); echo $ret; }

ApacheOpen(){ for F in $(pidof apache2); do sudo ls -l /proc/$F/fd | egrep "(avi|mkv|mp4|iso)" ; done }
ApacheOpenAll(){ for F in $(pidof apache2); do sudo ls -l /proc/$F/fd; done }
SSHOpen(){ for F in $(pidof sftp-server); do sudo ls -l /proc/$F/fd | egrep "(avi|mkv|mp4|iso|mp3)"; done }
SSHOpenAll(){ for F in $(pidof sftp-server); do sudeo ls -l /proc/$F/fd; done }

alias logout='clear; logout'
alias fsck="fsck -C"

alias bc='bc -l'

alias addprinter='system-config-printer'

alias flactomp3='for F in *.flac; do flac -c -d "$F" | lame -m j -q 0 --vbr-new -V 0 -s 44.1 - "$(echo $F | sed 's/flac/mp3/')" ;done'

alias objdump='objdump -M intel'

function fixglade(){
    sed -i.bak 's/ swapped="no"//g' $1
    sed -i.bak 's/<property name="x_options"\/>/<property name="x_options"><\/property>/g' $1
    sed -i.bak 's/<property name="y_options"\/>/<property name="y_options"><\/property>/g' $1
}

# Git shorthand
function fixup(){
    git commit -m "Fixup: $1"
}

alias stage='git push stage HEAD:master --force'
alias trystage='git commit --amend --no-edit && stage'
alias amend='git commit --amend'
