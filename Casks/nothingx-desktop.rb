cask "nothingx-desktop" do
  arch arm: "arm64", intel: "intel"

  version "1.0,1.0.0"
  sha256 arm:   "db7956f44d993df214c5765f21c160048cd28ba7f34c08d4275e5b903b74cbbe",
         intel: "e753191364e692a9cf06e7f45d4f4582dfffec79b4dbef0d03c28ad8d55854f0"

  url "https://github.com/nipunyatawara-dev/NothingX-Desktop/releases/download/v#{version.csv.first}/NothingX-Desktop-#{version.csv.second}-macos-#{arch}.dmg"
  name "NothingX Desktop"
  desc "Menu bar controls for Nothing and CMF headphones"
  homepage "https://github.com/nipunyatawara-dev/NothingX-Desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NothingX Desktop.app"

  zap trash: [
    "~/Library/Application Support/NothingX Desktop",
    "~/Library/Caches/dev.nothingx.desktop",
    "~/Library/Preferences/dev.nothingx.desktop.plist",
    "~/Library/Saved Application State/dev.nothingx.desktop.savedState",
  ]

  caveats <<~EOS
    NothingX Desktop is ad-hoc signed and unnotarized. macOS may ask you
    to approve it in System Settings → Privacy & Security on first launch.
  EOS
end
