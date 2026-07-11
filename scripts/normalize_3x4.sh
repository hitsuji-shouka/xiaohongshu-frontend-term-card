#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  printf 'Usage: %s INPUT.png OUTPUT.png\n' "$0" >&2
  exit 2
fi

input="$1"
output="$2"
work="$(mktemp /tmp/xhs-3x4.XXXXXX.png)"
trap 'rm -f "$work"' EXIT

width="$(sips -g pixelWidth "$input" | awk '/pixelWidth/ {print $2}')"
height="$(sips -g pixelHeight "$input" | awk '/pixelHeight/ {print $2}')"

# Preserve direct 3:4 generations; pad older 2:3 generations before export.
if [[ $((width * 4)) -eq $((height * 3)) ]]; then
  sips --resampleHeightWidth 1440 1080 "$input" --out "$output" >/dev/null
elif [[ $((width * 3)) -eq $((height * 2)) ]]; then
  sips --padToHeightWidth "$height" $((height * 3 / 4)) --padColor FFFFFF "$input" --out "$work" >/dev/null
  sips --resampleHeightWidth 1440 1080 "$work" --out "$output" >/dev/null
else
  printf 'Unsupported aspect ratio: %sx%s (expected 3:4 or 2:3)\n' "$width" "$height" >&2
  exit 1
fi

width="$(sips -g pixelWidth "$output" | awk '/pixelWidth/ {print $2}')"
height="$(sips -g pixelHeight "$output" | awk '/pixelHeight/ {print $2}')"
if [[ "$width" != "1080" || "$height" != "1440" ]]; then
  printf 'Invalid final dimensions: %sx%s (expected 1080x1440)\n' "$width" "$height" >&2
  exit 1
fi
