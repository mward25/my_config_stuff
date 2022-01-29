# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200
#export PATH=$PATH:~.gem/ruby/2.5.0/bin/:~.local/bin
export TESSDATA_PREFIX=/opt/tessdata_custom/tessdata_best
test -s ~/.alias && . ~/.alias || true

# make x over ssh work
export DISPLAY=:0.0
#export DISPLAY=`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`

#enablex.sh

export GH_EDITOR=vim

alias vi=vim

alias ls="ls --color=auto"

# Makes my stupid ls typos still work
alias sl="ls"
alias lls="ls"
alias sls=ls
alias slsl=ls
alias lss=ls
alias lssl=ls

# if the ARC vairiable is not set, set it to x86_64
if [ -z "$ARC" ]
then
    export ARC="x86_64"
    if [ -z "$arc"]
    then
        export arc=$ARC
    fi
fi

# make git take less work
alias git_push_or="git push origin"
alias gitAAC="git add . && git commit"
. /usr/share/bash-completion/completions/git

# Makes cls clear the screen
alias cls=clear

# make opengl work better
export LIBGL_ALWAYS_INDIRECT=0

# This makes my life easier by giving me a shortcut so I have to type less
#alias mvytdl="./mv_old && youtube-dl  --external-downloader aria2c --external-downloader-args -x16 --external-downloader-args -s16"
#alias mvytdl="./mv_old && youtube-dl "



# --external-downloader COMMAND        Use the specified external downloader.                                                                                                                                  Currently supports aria2c,avconv,axel,c                                                                                                                                 url,ffmpeg,httpie,wget                                                                                                             --external-downloader-args ARGS      Give these arguments to the external

# export DISPLAY=localhost:0.0
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/miles/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/miles/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/miles/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/miles/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

