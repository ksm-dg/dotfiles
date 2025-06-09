# Version meant for inputrc
#"\e[A":history-search-backward
#"\e[B":history-search-forward

if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
