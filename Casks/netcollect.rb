cask "netcollect" do
  version "1.0.0"
  sha256 "3b44d29a4dc111879005c57cecbc38c0c507e1ce6e0d881bc742d6a85b1e01bd"

  url "https://github.com/nipunyatawara-dev/NetCollect/releases/download/v#{version}/NetCollect-v#{version}.dmg"
  name "NetCollect"
  desc "Network monitor for tracking per-application data usage"
  homepage "https://github.com/nipunyatawara-dev/NetCollect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "NetCollect.app"

  zap trash: [
    "~/Library/Application Support/NetCollect",
    "~/Library/Preferences/com.netcollect.app.plist",
  ]

  caveats <<~EOS
    NetCollect is ad-hoc signed. If macOS blocks it on first launch, run:
      xattr -cr /Applications/NetCollect.app
  EOS
end
