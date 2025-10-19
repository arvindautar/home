tar -czf fontconfig-backup.tar.gz fontconfig-backup-2025*
# verplaats naar nieuwe systeem
tar -xzf fontconfig-backup.tar.gz -C ~/
cp -r ~/fontconfig-backup-*/fontconfig ~/.config/
cp -r ~/fontconfig-backup-*/fonts/.fonts ~/
cp -r ~/fontconfig-backup-*/fonts/.local/share/fonts ~/.local/share/fonts
sudo cp ~/fontconfig-backup-*/environment.backup /etc/environment
fc-cache -fr
