git config user.name "Random Geek"
git config user.email randomgeek78@gmail.com

if ! command -v "yadm" >& /dev/null; then
  if command -v "apt" >& /dev/null; then
    sudo apt install -y yadm
  elif command -v "dnf" >& /dev/null; then
    sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_33/home:TheLocehiliosan:yadm.repo
    sudo dnf install -y yadm
  fi
fi
