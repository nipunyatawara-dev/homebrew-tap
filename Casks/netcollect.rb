cask "netcollect" do
  version "1.0.0,2"
  sha256 "8be2e1470c69542416361b5ae8ea9afc6c69caa32c39828c864060e499052e9b"

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
