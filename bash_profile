
#------ VulnHound Customs ------

mass(){
    hunt
    cd massdns
    ./scripts/subbrute.py /Users/Dex/tools/wordlists/all.txt $1 | ./bin/massdns -r lists/resolvers.txt -t
    bb
}

alias devpy="cd ~/Documents/Python && clear && pwd && ls -l"
alias devc="cd ~/Documents/CLang && clear && pwd && ls -l"
alias devgo="cd ~/Documents/GoLang && clear && pwd && ls -l"
alias devbash="cd ~/Documents/BASH && clear && pwd && ls -l"
alias hunt="cd ~/tools && clear && pwd && ls -l"
alias bb="cd ~/BugBounty && clear && pwd && ls -l"
alias cl="clear && pwd && ls -l"
