# Home Backup – Fontconfig & Config Files

Dit project bevat een persoonlijke back-up van mijn **fontconfig-instellingen** en enkele shell-scripts om ze te herstellen of opnieuw toe te passen.

##  Inhoud

- **fontconfig-backup/**  
  Bevat alle `.conf`-bestanden uit `~/.config/fontconfig/conf.d/`  
  en een kopie van `fonts.conf` en `environment.backup`.

- **backup-fontconfig.sh**  
  Script dat mijn huidige fontconfig-instellingen exporteert naar deze map.

- **how-to-restore.sh**  
  Script om de instellingen terug te zetten op een nieuw systeem.

- **herstel.sh**  
  Kort hulpmiddel voor handmatig herstel of testen van de back-up.

- **.gitignore**  
  Zorgt ervoor dat grote archieven (`.tar.gz`) niet per ongeluk worden meegestuurd.

## Gebruik

### Back-up maken
```bash
./backup-fontconfig.sh
git add .
git commit -m "update fontconfig backup"
git push

Herstellen

./how-to-restore.sh
# of
./herstel.sh


Laatste update: $(date +"%Y-%m-%d")
