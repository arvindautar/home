# Linux Font Rendering Configuration

Deze configuratie verbetert de standaard Linux-fontweergave door:
- alleen de OTF-versie van **Inter** te gebruiken (geen variabele of TTC-bestanden),
- consistente hinting en antialiasing toe te passen,
- en **stem-darkening** volledig uit te schakelen voor zuivere, evenwichtige tekst.

## Doel
Veel Linux-distributies renderen fonts te vet of te onscherp door variabele fonts, subpixelkleuren en inconsistent hintgedrag.  
Deze setup brengt het uiterlijk dichter bij macOS/Windows: helder, gelijkmatig en zonder kleurfranjes.

## Belangrijkste instellingen
### 1. Fontconfig
- **Inter OTF** als standaard `sans-serif`
- **JetBrains Mono** als `monospace`
- **Noto Serif** als `serif`
- Systeemfonts uit `/usr/share/fonts/inter` (TTC en Variable) worden geblokkeerd
- Antialiasing: `grayscale`
- Hinting: `hintslight`

### 2. FreeType (in `/etc/environment`)
```bash
FREETYPE_PROPERTIES="autofitter:no-stem-darkening=1 cff:no-stem-darkening=1 type1:no-stem-darkening=1 t1cid:no-stem-darkening=1"


# Fontconfig Backup en Herstel

Deze configuratie bewaart en herstelt alle instellingen voor strakke Linux-fontweergave met Inter OTF, JetBrains Mono en Noto Serif. Ze omvat zowel de Fontconfig-regels als de FreeType-parameters uit `/etc/environment`.

## backup-fontconfig.sh
Maakt een volledige back-up van:
- `~/.config/fontconfig/`
- `~/.fonts/` en `~/.local/share/fonts/`
- `/etc/environment` (inclusief FREETYPE_PROPERTIES)
- en genereert een overzichtsbestand met alle actieve fonts.

Gebruik:
```bash
chmod +x backup-fontconfig.sh
./backup-fontconfig.sh
