# itsmejay80 Homebrew Tap

Install:

```sh
brew install --cask itsmejay80/tap/nook
```

## Available casks

- **nook** — local-first, spatial workboard desktop app. https://github.com/itsmejay80/nook

## macOS Gatekeeper note

Nook is ad-hoc signed but not Apple-notarized (no paid Developer ID). The cask's `postflight` strips the quarantine attribute on install, so `brew install --cask itsmejay80/tap/nook` should launch cleanly.

If you hit the *"Apple could not verify…"* dialog (e.g. manual DMG install), run:

```sh
xattr -dr com.apple.quarantine /Applications/Nook.app
```

Then reopen the app.
