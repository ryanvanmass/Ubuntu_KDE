#!/bin/bash
############### Installs ZSH and Required Plug Ins ###############
sudo apt install -y zsh autojump zsh-autosuggestions zsh-syntax-highlighting

############### Downloads ZSH Theme Configurator ###############
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/powerlevel10k/

############### Downloads Required Fonts ###############
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

############### "Installs" Fonts ###############
sudo cp 'MesloLGS NF Regular.ttf' /usr/share/fonts/
rm 'MesloLGS NF Regular.ttf'

sudo cp 'MesloLGS NF Bold.ttf' /usr/share/fonts
rm 'MesloLGS NF Bold.ttf'

sudo cp 'MesloLGS NF Italic.ttf' /usr/share/fonts
rm 'MesloLGS NF Italic.ttf'

sudo cp 'MesloLGS NF Bold Italic.ttf' /usr/share/fonts
rm 'MesloLGS NF Bold Italic.ttf'

############### Configures Terminal Emulators ###############
# Terminator
mkdir /home/$USER/.config/terminator/
cp Install/ConfigFiles/Terminal/Terminator.config /home/$USER/.config/terminator/config

#Yakuake
cp Install/ConfigFiles/Terminal/yakuakerc /home/$USER/.config


############### Copys ZSHRC file to User .zshrc ###############
cat Shell/ZSH/zshrc >> /home/$USER/.zshrc

############### Changes defualt Shell to ZSH ###############
sudo chsh $USER -s /bin/zsh

############### Copies Aliasrc file to user Directory ###############
cp Shell/aliasrc /home/$USER/.aliasrc
