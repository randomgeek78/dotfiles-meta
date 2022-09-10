git config user.name "Random Geek"
git config user.email randomgeek78@gmail.com

sudo apt update -y
sudo apt upgrade -y

if ! command -v "yadm" >& /dev/null; then
  if command -v "apt" >& /dev/null; then
    sudo apt install -y yadm

    sudo apt install jq -y
    bazelisk_url=$(curl -sL https://api.github.com/repos/bazelbuild/bazelisk/releases/latest | jq -cr '.assets[] | select( .name | contains("linux-amd64")) | .browser_download_url')
    curl -sL $bazelisk_url | sudo tee /usr/local/bin/bazelisk > /dev/null
    sudo chmod +x /usr/local/bin/bazelisk
    
    sudo ln -s bazelisk /usr/local/bin/bazel

  elif command -v "dnf" >& /dev/null; then
    sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_33/home:TheLocehiliosan:yadm.repo
    sudo dnf install -y yadm
  fi
fi

if [[ $local_system =~ ^(GNU/Linux)$ ]] ; then
  sudo apt install jq -y
  bazelisk_url=$(curl -sL https://api.github.com/repos/bazelbuild/bazelisk/releases/latest | jq -cr '.assets[] | select( .name | contains("linux-amd64")) | .browser_download_url')
  curl -sL $bazelisk_url | sudo tee /usr/local/bin/bazelisk > /dev/null
  sudo chmod +x /usr/local/bin/bazelisk

  sudo ln -s /usr/local/bin/bazelisk /usr/local/bin/bazel
fi
