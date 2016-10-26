#curl -u BitSails -X POST https://api.github.com/repos/octocat/Hello-World/forks

curl -u $3 -X POST https://api.github.com/repos/"$1"/"$2"/forks
git config --global user.name "$3"
git config --global user.email "$3@users.noreply.github.com"
