cask "sieve-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "23a0f8fdb6d3cfb119a6e3773b953ce176f5635cc4b1b55070b305be49eb468b",
         intel: "7ac2eb83869040d063c42fc55e5c7bb0fe7b25cd910afc096164be505abc1790"

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
