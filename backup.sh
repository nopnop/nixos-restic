#!/usr/bin/env bash

echo "Backup started at $(date)"

restic backup --verbose ~/Documents ~/.config/google-chrome ~/.local/share/DBeaverData  \
  --exclude .cache \
  --exclude node_modules \
  --skip-if-unchanged

