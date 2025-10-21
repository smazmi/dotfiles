#!/usr/bin/env bash
# Adjust external monitor brightness via DDC/CI
# Usage: monitor-brightness up|down [step]

BUS=1        # i2c bus for Acer monitor
STEP=${2:-5} # brightness step in percent (default 5)

# Get current brightness
CURRENT=$(ddcutil --noverify --bus=$BUS getvcp 10 |
  awk -F'current value =' '{print $2}' |
  awk -F',' '{print $1}' |
  tr -d ' ')

if [[ -z "$CURRENT" ]]; then
  notify-send -h string:x-canonical-private-synchronous:monitor-brightness \
    -u low \
    "Monitor Brightness" "Error: Could not read brightness"
  exit 1
fi

# Adjust
if [[ "$1" == "up" ]]; then
  NEW=$((CURRENT + STEP))
elif [[ "$1" == "down" ]]; then
  NEW=$((CURRENT - STEP))
else
  notify-send -h string:x-canonical-private-synchronous:monitor-brightness \
    -u low \
    "Monitor Brightness" "Usage: $0 up|down [step]"
  exit 1
fi

# Clamp
((NEW > 100)) && NEW=100
((NEW < 0)) && NEW=0

# Set brightness
ddcutil --noverify --bus=$BUS setvcp 10 $NEW

# Notify (with replacement tag so Mako updates instead of stacking)
notify-send -h string:x-canonical-private-synchronous:monitor-brightness \
  -u low \
  -h int:value:"$NEW" \
  "Monitor Brightness" "${NEW}%"
