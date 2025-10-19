cp -r ~/fontconfig-backup/fontconfig ~/.config/
sudo cp ~/fontconfig-backup/environment.backup /etc/environment
fc-cache -fr
