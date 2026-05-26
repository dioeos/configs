#!/usr/bin/env bash
ENV_PATH="../../.env"

if [ -f "$ENV_PATH" ]; then
  export $(cat "$ENV_PATH" | xargs )
fi

bluetoothctl connect "$AIRPODS_MAC"

if [ $? -eq 0 ]; then
  echo "Successfully connected to your Airpods!"
else
  echo "Connection failed... </3. Ensure device is on and in range."
fi

echo "Script for connecting to your Airpods has concluded."

