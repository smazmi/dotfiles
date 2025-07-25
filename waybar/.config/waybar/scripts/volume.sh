#!/usr/bin/env bash

DEVICE="$1" # 'o' (output/speaker) or 'i' (input/mic)
ACTION="$2" # i (increase), d (decrease), m (mute toggle), get
STEP=5

# Check for pamixer
if ! command -v pamixer &>/dev/null; then
  echo '{"text": "⚠️", "tooltip": "pamixer not found", "class": "error"}'
  exit 1
fi

# Set config per device
if [[ "$DEVICE" == "o" ]]; then
  TARGET=""
  SIGNAL=10
  ICON_MUTED="󰖁"
  TYPE="speaker"
elif [[ "$DEVICE" == "i" ]]; then
  TARGET="--default-source"
  SIGNAL=11
  ICON_MUTED="󰍭"
  TYPE="mic"
else
  echo '{"text": "Invalid", "class": "error"}'
  exit 1
fi

# Run action if provided
case "$ACTION" in
get | "") ;;
i) pamixer $TARGET --increase "$STEP" ;;
d) pamixer $TARGET --decrease "$STEP" ;;
m) pamixer $TARGET --toggle-mute ;;
*)
  echo '{"text": "Invalid", "class": "error"}'
  exit 1
  ;;
esac

# Determine volume/mute state
if pamixer $TARGET --get-mute | grep -q true; then
  echo "{\"text\": \"$ICON_MUTED\", \"class\": \"muted\"}"
else
  VOL=$(pamixer $TARGET --get-volume)

  if [[ "$TYPE" == "speaker" ]]; then
    if [ "$VOL" -eq 0 ]; then
      ICON="󰖁"
    elif [ "$VOL" -le 30 ]; then
      ICON="󰕿"
    elif [ "$VOL" -le 70 ]; then
      ICON="󰖀"
    else
      ICON="󰕾"
    fi
  else
    ICON=""
  fi

  echo "{\"text\": \"$ICON $VOL%\", \"tooltip\": \"$TYPE volume\", \"class\": \"active\"}"
fi

# Send Waybar signal if action triggered
if [[ "$ACTION" != "get" && -n "$ACTION" ]]; then
  pkill -SIGRTMIN+$SIGNAL waybar
fi
