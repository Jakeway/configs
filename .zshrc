export PATH=$PATH:/Applications/tomcat/bin
alias ..='cd ..'
alias dev='cd ~/Development'
alias ls='ls -G'
setopt PROMPT_SUBST
export TERM=xterm-256color
PROMPT='%n@%m:%1~ '
function tmux_attach { tmux attach -t $1;}
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
