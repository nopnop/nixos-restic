#!/usr/bin/env bash

echo "Backup started at $(date)"

restic backup --verbose ~/Documents ~/.config/google-chrome ~/.local/share/DBeaverData ~/.bash_history  \
  --exclude .cache \
  --exclude node_modules \
  --exclude '*.qcow2' \
  --skip-if-unchanged

