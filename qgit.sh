#quick git setup

#aliases
git config --global push.default matching  #so that 'git push' doesn't complain
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cm 'commit -m'
git config --global alias.st status
git config --global alias.lg 'log --pretty="format:%ad %C(bold blue)%h%Creset %C
(green)(%an)%Creset %C(dim yellow)\"%s\"" --date=short'

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
  
