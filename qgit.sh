#quick git setup

#aliases
alias gpush='git push origin master'
alias gadd='git add'
alias gcom='git commit'

#setup and clone repo
if [ "$#" -gt 0 ] 
then
  git config --global user.name $1 && git config --global user.email $1@users.noreply.github.com
  
  if [ "$#" -eq 2 ]
   then
      git clone https://github.com/"$1"/"$2"
      cd "$2"
  fi
fi
  
