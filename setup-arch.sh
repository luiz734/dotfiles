echo "Install yay"
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf "yay"
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

echo "Install <change this message>"
yay -S zsh
# clone zsh config
chsh -s /usr/bin/zsh
# clone meslo fonts
mkdir ~/.local/share/fonts
# mv *.ttf ~/.local/share/fonts 

yay -S lsd tldr fzf mandoc bat tmux neovim mpv pacman-contrib xclip tree\
reflector
tldr -u
mkdir ~/.config/neovim
# clone nvim config
# move config
paccache -rk1

echo "Enable bluetooth service"
# enable services services
systemctl enable --now bluetooth.service
systemctrl enable --now paccache.timer
systemctl enable --now reflector.timer
settings set org.gnome.shell.app-switcher current-workspace-only true

