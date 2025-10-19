#!/usr/bin/env bash
set -e

BACKUP_DIR="$HOME/fontconfig-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "→ Back-uppen van configuratie..."
cp -r ~/.config/fontconfig "$BACKUP_DIR/"

echo "→ Back-uppen van fonts in home..."
# zowel .fonts als .local/share/fonts, voor alle zekerheid
mkdir -p "$BACKUP_DIR/fonts"
[ -d "$HOME/.fonts" ] && cp -r "$HOME/.fonts" "$BACKUP_DIR/fonts/"
[ -d "$HOME/.local/share/fonts" ] && cp -r "$HOME/.local/share/fonts" "$BACKUP_DIR/fonts/"

echo "→ Back-uppen van systeemomgeving..."
sudo cp /etc/environment "$BACKUP_DIR/environment.backup" 2>/dev/null || \
  cp /etc/environment "$BACKUP_DIR/environment.backup" 2>/dev/null || true

echo "→ Overzicht opslaan..."
{
  echo "==== USER FONTS ===="
  fc-list | grep -iE 'inter|noto|liberation|cantarell' || true
  echo
  echo "==== FONT PATHS ===="
  fc-list : file | sort -u
} > "$BACKUP_DIR/font-list.txt"

echo "Backup voltooid: $BACKUP_DIR"
