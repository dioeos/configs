#/usr/bin/env bash

current="$(ibus engine)"

if [ "$current" = "hangul" ]; then
  ibus engine xkb:us::eng
else
  ibus engine hangul
fi
