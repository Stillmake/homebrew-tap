# Stillmake Homebrew Tap

```bash
brew install --cask stillmake/tap/actor
brew install --cask stillmake/tap/asterisk
brew install --cask stillmake/tap/inline
```

## Releasing

After a DMG is published to its GitHub release:

```bash
./scripts/bump.sh <cask> <path/to/App.dmg>
```

It reads version and build from the DMG, writes them and the sha256 into `Casks/<cask>.rb`, then commits and pushes.
