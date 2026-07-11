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

# Generated portrait assets are often 1024x1536 (2:3). Pad sides first,
# then resize to the exact Xiaohongshu export canvas of 1080x1440.
sips --padToHeightWidth 1536 1152 --padColor FFFFFF "$input" --out "$work" >/dev/null
sips --resampleHeightWidth 1440 1080 "$work" --out "$output" >/dev/null

width="$(sips -g pixelWidth "$output" | awk '/pixelWidth/ {print $2}')"
height="$(sips -g pixelHeight "$output" | awk '/pixelHeight/ {print $2}')"
if [[ "$width" != "1080" || "$height" != "1440" ]]; then
  printf 'Invalid final dimensions: %sx%s (expected 1080x1440)\n' "$width" "$height" >&2
  exit 1
fi
