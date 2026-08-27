cask "omnisync" do
  arch arm: "arm64", intel: "x64"

  version "0.5b"
  sha256 arm:   "0e1b96adc8fa27860581a961c4d80e1d8eda1fb25973ab9bee1a9d15b8dfcf0f",
         intel: "d2d53666b5e4488d81a6f42f50eec7df867a85be882e3765b1e5e45f66b487aa"

  url "https://github.com/nipunyatawara-dev/OmniSync/releases/download/v#{version}/OmniSync%20v#{version}-mac-#{arch}.dmg"
  name "OmniSync"
  desc "Desktop workspace hub and Git collaboration dashboard"
  homepage "https://github.com/nipunyatawara-dev/OmniSync"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "OmniSync.app"

  zap trash: [
    "~/Library/Application Support/OmniSync",
    "~/Library/Preferences/com.omnisync.app.plist",
    "~/Library/Saved Application State/com.omnisync.app.savedState",
  ]

  caveats <<~EOS
    OmniSync is ad-hoc signed. If macOS blocks it on first launch, run:
      xattr -cr /Applications/OmniSync.app
  EOS
end
