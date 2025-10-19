```markdown
# Linux Font Rendering Configuration

Deze configuratie optimaliseert de fontweergave op Linux voor maximale scherpte, balans en consistentie. Ze gebruikt uitsluitend **Inter OTF** (geen Variable of TTC), schakelt **stem-darkening uit**, en forceert **grayscale antialiasing** met **hintslight**. Het resultaat is een neutrale, evenwichtige tekstweergave — vergelijkbaar met macOS of Windows, maar zonder kleurfranjes of onscherpte.

## Kerninstellingen

### Fontconfig
- Sans-serif → Inter  
- Monospace → JetBrains Mono  
- Serif → Noto Serif  
- Blokkeert systeemfonts uit `/usr/share/fonts/inter` (TTC + Variable)  
- Antialiasing: `grayscale`  
- Hinting: `hintslight`

Fonts worden geplaatst in:
```

~/.local/share/fonts/otf/

```
Herbouw daarna de cache:
```

fc-cache -fr

```

### FreeType (/etc/environment)
Schakel alle stem-darkening uit:
```

FREETYPE_PROPERTIES="autofitter:no-stem-darkening=1 cff:no-stem-darkening=1 type1:no-stem-darkening=1 t1cid:no-stem-darkening=1"

```
Log daarna opnieuw in voor effect.

## Controle
```

fc-match -s sans-serif | head -n5
fc-match monospace
fc-list | grep -i '^/usr/share/fonts/inter' || echo "OK: niets uit /usr/share/fonts/inter"
echo $FREETYPE_PROPERTIES

```

## Backup en Herstel

De scripts `backup-fontconfig.sh` en `herstel.sh` maken het eenvoudig om alle instellingen te bewaren of terug te zetten op een nieuw systeem.

### backup-fontconfig.sh
Maakt een volledige backup van:
- `~/.config/fontconfig/`
- `~/.fonts/` en `~/.local/share/fonts/`
- `/etc/environment`
- overzichtsbestand `font-list.txt`

Gebruik:
```

chmod +x backup-fontconfig.sh
./backup-fontconfig.sh

```
Resultaat: een map `fontconfig-backup-YYYYMMDD-HHMMSS/` met alle configuraties.

(Optioneel) comprimeer de backup:
```

tar -czf fontconfig-backup.tar.gz fontconfig-backup-*

```

### herstel.sh
Herstelt de configuratie en fonts op een nieuw systeem:
```

chmod +x herstel.sh
./herstel.sh

```
Dit kopieert alle bestanden naar de juiste locaties en herbouwt de fontcache automatisch.

## Tips
- Zie je toch Variable/TTC-fonts? Voeg een extra `<rejectfont>`-regel toe en voer `fc-cache -fr` uit.  
- Te dunne tekst op lage DPI? Zet `cff:no-stem-darkening=0` aan voor iets vollere letters.  
- Voor Flatpak-apps, geef toegang tot fonts/config:
```

flatpak override --user --filesystem=$HOME/.local/share/fonts:ro com.brave.Browser
flatpak override --user --filesystem=$HOME/.config/fontconfig:ro com.brave.Browser

```

## Resultaat
✔ Inter OTF als standaard sans-serif  
✔ JetBrains Mono als monospace  
✔ Noto Serif als serif  
✔ Geen systeem- of variabele Inter-fonts actief  
✔ Helder, kleurvrij en consistent renderend beeld in GNOME, Flatpak, browsers en code-editors
```
