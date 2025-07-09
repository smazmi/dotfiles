#!/bin/bash

if [ "$1" = "toggle" ]; then
  # Toggle DND mode based on makoctl's current mode
  if [ "$(makoctl mode)" = "dnd" ]; then
    makoctl mode -r dnd && echo "DND Mode OFF"
  else
    makoctl mode -s dnd && echo "DND Mode ON"
  fi
elif [ "$1" = "get" ]; then
  # Return appropriate JSON for Waybar module
  if [ "$(makoctl mode)" = "dnd" ]; then
    echo '{"text": "", "tooltip": "Do Not Disturb is ON"}'
  else
    echo '{"text": "", "tooltip": "Notifications are ON"}'
  fi
fi
