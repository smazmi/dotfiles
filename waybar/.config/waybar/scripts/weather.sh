#!/bin/bash

location_data=$(curl -s "http://ip-api.com/json/")
CITY=$(echo "$location_data" | jq -r '.city // empty')
# COUNTRY=$(echo "$location_data" | jq -r '.countryCode // empty')

# Combine city and country (optional fallback)
# LOCATION="${CITY},${COUNTRY}"
LOCATION="${CITY}"

# Use wttrbar with dynamic location
wttrbar --ampm --hide-conditions --nerd --location "$LOCATION"
