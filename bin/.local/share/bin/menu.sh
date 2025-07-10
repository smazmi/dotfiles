#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
  echo "Wofi is already running."
  exit
else
  wofi --show drun
fi
