# Linux Font Rendering Configuration

Deze configuratie verbetert de standaard font rendering op Linux voor maximale helderheid, balans en leesbaarheid.  
Ze gebruikt uitsluitend **Inter OTF** (geen Variable of TTC), zet **grayscale antialiasing** aan, **hintslight** voor zachte randen,  
en schakelt **stem-darkening** volledig uit voor een consistent, natuurlijk beeld zonder kleurfranjes of schaduwverschillen.

## Kernpunten

- Sans-serif → Inter (OTF)
- Monospace → JetBrains Mono
- Serif → Noto Serif
- Blokkeert systeemfonts uit `/usr/share/fonts/inter` (Variable en TTC)
- Antialiasing: grayscale
- Hinting: hintslight
- Stem-darkening: uitgeschakeld

## FreeType configuratie

Plaats dit in `/etc/environment`:

```
FREETYPE_PROPERTIES="autofitter:no-stem-darkening=1 cff:no-stem-darkening=1 type1:no-stem-darkening=1 t1cid:no-stem-darkening=1"
```

## Fontconfig locaties

Fonts:
```
~/.local/share/fonts/otf/
```

Cache heropbouwen:
```
fc-cache -fr
```

Controle:
```
fc-match -s sans-serif | head -n5
fc-match monospace
fc-list | grep -i '^/usr/share/fonts/inter' || echo "OK: niets uit /usr/share/fonts/inter"
```

## Backup en herstel

Gebruik de twee scripts om je configuratie te bewaren en terug te zetten op een ander systeem.

### backup-fontconfig.sh
Maakt een volledige backup van:
- `~/.config/fontconfig/`
- `~/.fonts/` en `~/.local/share/fonts/`
- `/etc/environment`
- en genereert `font-list.txt` met een overzicht van alle actieve fonts

### herstel.sh
Zet alles terug en herbouwt de cache.

## Flatpak toegang (optioneel)

Voor Flatpak-apps (zoals Brave):
```
flatpak override --user --filesystem=$HOME/.local/share/fonts:ro com.brave.Browser
flatpak override --user --filesystem=$HOME/.config/fontconfig:ro com.brave.Browser
```

## Resultaat

✔ Inter OTF als standaard sans-serif  
✔ JetBrains Mono als monospace  
✔ Noto Serif als serif  
✔ Geen systeemfonts of variabele Inter actief  
✔ Schone, kleurvrije en consistente rendering in GNOME, Flatpak en browsers
