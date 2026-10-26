#!/bin/zsh

# Points a cask at a published DMG: version and build come from the DMG's
# Info.plist, sha256 from its bytes. Casks whose version is "short,build"
# get both; the rest get the short version. Commits only the cask and
# pushes the tap; a cask already at this DMG is a no-op.
#
# Usage:
#   ./scripts/bump.sh <cask> <path/to/App.dmg>

set -euo pipefail

TAP_DIR=$(cd "$(dirname "$0")/.." && pwd)
CASK="$TAP_DIR/Casks/$1.rb"
DMG="$2"

[[ -f "$CASK" ]] || { echo "Error: no cask at $CASK" >&2; exit 1; }
[[ -f "$DMG" ]] || { echo "Error: no DMG at $DMG" >&2; exit 1; }

MOUNT=$(mktemp -d)
trap 'hdiutil detach "$MOUNT" -quiet 2>/dev/null; rmdir "$MOUNT"' EXIT
hdiutil attach "$DMG" -mountpoint "$MOUNT" -nobrowse -quiet -readonly
APPS=("$MOUNT"/*.app(N))
(( ${#APPS} == 1 )) || { echo "Error: expected one .app in $DMG" >&2; exit 1; }
SHORT=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$APPS[1]/Contents/Info.plist")
BUILD=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$APPS[1]/Contents/Info.plist")

if rg -q '^  version "[^"]*,[^"]*"$' "$CASK"; then
  VERSION="$SHORT,$BUILD"
else
  VERSION="$SHORT"
fi
SHA=$(shasum -a 256 "$DMG" | cut -d' ' -f1)

sed -i '' -E \
  -e "s/^  version \".*\"$/  version \"$VERSION\"/" \
  -e "s/^  sha256 .*$/  sha256 \"$SHA\"/" \
  "$CASK"

cd "$TAP_DIR"
git add -- "$CASK"
if git diff --cached --quiet -- "$CASK"; then
  echo "$1 is already at $VERSION."
else
  git commit -q -m "$1: $VERSION" -- "$CASK"
fi
git pull -q --rebase --autostash origin main
git push -q origin HEAD:main
echo "$1 → $VERSION ($SHA)"
