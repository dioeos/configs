#!/usr/bin/env bash
ENV_PATH="../../.env"

if [ -f "$ENV_PATH" ]; then
  export $(cat "$ENV_PATH" | xargs )
fi

bluetoothctl disconnect "$AIRPODS_MAC"

if [ $? -eq 0 ]; then
  echo "Successfully disconnected from your Airpods!"
else
  echo "Disconnect failed... </3"
fi

echo "Script for disconnecting from your Airpods has concluded."

