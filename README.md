# Stillmake Homebrew Tap

```bash
brew tap stillmake/tap
brew trust stillmake/tap   # Homebrew asks before loading third-party casks
brew install --cask stillmake/tap/actor
brew install --cask stillmake/tap/asterisk
brew install --cask stillmake/tap/inline
brew install --cask stillmake/tap/localdictation
```

## Releasing

After a DMG is published to its GitHub release:

```bash
./scripts/bump.sh <cask> <path/to/App.dmg>
```

It reads version and build from the DMG, writes them and the sha256 into `Casks/<cask>.rb`, then commits and pushes.
