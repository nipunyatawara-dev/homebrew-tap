cask "netcollect" do
  version "1.0.0"
  sha256 "6428849c6cd2de0d28b5b605774983a9541d22f693c3443eb30867413406a9e1"

  url "https://github.com/nipunyatawara-dev/homebrew-tap/releases/download/netcollect-v#{version}/NetCollect-v#{version}.dmg"
  name "NetCollect"
  desc "Network monitor for tracking per-application data usage"
  homepage "https://github.com/nipunyatawara-dev/NetCollect"

  livecheck do
    url :url
    regex(/^netcollect-v?(\d+(?:\.\d+)+)$/i)
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
