# Homebrew Tap

Homebrew casks for my apps.

## sieve-gui

A desktop editor for server-side Sieve mail filters: [lukas-runge/sieve-gui](https://github.com/lukas-runge/sieve-gui).

```sh
brew install lukas-runge/tap/sieve-gui
```

Updates: `brew upgrade sieve-gui`.

The app isn't notarized yet. The cask removes the quarantine attribute after installing, so macOS opens it without the Gatekeeper prompt. `Casks/sieve-gui.rb` is updated by sieve-gui's release workflow.
