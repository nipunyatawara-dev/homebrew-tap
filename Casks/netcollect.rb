cask "netcollect" do
  version "1.0.0"
  sha256 "c382ed29352452e2141538e5271870da7300129d1e21d4dab9f5f01fc2254311"

  url "https://github.com/nipunyatawara-dev/NetCollect/releases/download/v#{version}/NetCollect-v#{version}.dmg"
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
