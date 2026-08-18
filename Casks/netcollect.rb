cask "netcollect" do
  version "1.0.0"
  sha256 "afbe19a2ea84cf4f37bcde81b16ded1db6a7727b711ec92461b9a690ad9c4050"

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
