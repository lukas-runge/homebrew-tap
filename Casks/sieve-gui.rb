cask "sieve-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "83d7dc2838eeae54b157617f3157f568a2d8f12420fae97a9942405a07a66c40",
         intel: "9bd668c4d7a02cf55a753afc4db013c5cfc1b938421381ed14692c45c1a17219"

  url "https://github.com/lukas-runge/sieve-gui/releases/download/v#{version}/sieve-gui_#{version}_#{arch}.dmg"
  name "sieve-gui"
  desc "Editor for server-side Sieve mail filters"
  homepage "https://github.com/lukas-runge/sieve-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "sieve-gui.app"

  # Not notarized yet: without the quarantine attribute Gatekeeper lets the
  # (ad-hoc signed) app open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/sieve-gui.app"]
  end

  zap trash: [
    "~/Library/Application Support/de.lukasrunge.sieve-gui",
    "~/Library/Caches/de.lukasrunge.sieve-gui",
    "~/Library/WebKit/de.lukasrunge.sieve-gui",
  ]
end
