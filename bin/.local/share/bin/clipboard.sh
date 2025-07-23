#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
  echo "Wofi is already running."
  exit
else
  cliphist list | wofi --dmenu | cliphist decode | wl-copy
fi
