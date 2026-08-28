cask "netcollect" do
  version "1.1.0,3"
  sha256 "90bab45d40b0774886e0fda7b9fc3adf51a7dca4a80467192006f06234e2cdd5"

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
