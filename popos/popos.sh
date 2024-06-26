#! /bin/bash

curdir=$(pwd)

sudo apt update

sudo apt install git gh kitty zsh tmux ripgrep npm gcc cargo fzf \
wl-clipboard xclip \
feh bat gimp make curl \
ninja-build gettext cmake unzip build-essential \
golang firefox nautilus wget


sudo ln -s /usr/bin/batcat /usr/bin/bat

# change jdk when new cool thingd come out
sudo apt install openjdk-21-jdk docker-compose maven gradle

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir ~/.local/share/fonts 
mkdir ~/.local/share/fonts/JetBrains
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrains
rm JetBrainsMono.zip

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

curl https://sh.rustup.rs -sSf | sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install node

# add this to your ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile

sudo cp scripts/tmux_sessions /usr/bin
cp config/kitty/ ~/.config/ -r
cp .tmux.conf  ~/
cp .zshrc ~/

sudo usermod -aG video ${USER}

cd ~/.config
git clone https://github.com/ring0-rootkit/nvim

sudo apt upgrade
sudo apt full-upgrade
sudo apt autoremove

#----add here things you want to run after all the newest packages are installed-----

cd $curdir
chmod +x ../stream/install.sh
sudo ../stream/install.sh

chmod +x ./shortcuts_gnome.sh
./shortcuts_gnome.sh

cd ~/
mkdir personal
cd personal
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

git config --global user.name "ring0-rootkit"
git config --global user.email "ord1naryman.dmitry@gmail.com"

