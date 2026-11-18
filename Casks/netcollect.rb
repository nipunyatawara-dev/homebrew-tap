cask "netcollect" do
  version "1.2.0,4"
  sha256 "75f813f7c4cb86c7cc5add9b59c3ed13ac4d16f040d6e631f544ac588950eda0"

  url "https://github.com/nipunyatawara-dev/NetCollect/releases/download/v#{version.csv.first}/NetCollect-v#{version.csv.first}.dmg"
  name "NetCollect"
  desc "Network monitor for tracking per-application data usage"
  homepage "https://github.com/nipunyatawara-dev/NetCollect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
