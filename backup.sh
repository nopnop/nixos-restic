#!/usr/bin/env bash

echo "Backup started at $(date)"

restic backup --verbose ~/Documents \
  --exclude .cache \
  --exclude node_modules \
  --skip-if-unchanged