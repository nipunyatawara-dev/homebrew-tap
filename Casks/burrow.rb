cask "burrow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0"
  sha256 arm:   "778b602c34cc695dcf9e348e1f03251ff55d2094cdd4cee65e9f7c1e44504a83",
         intel: "ee047955f7fc297ad3bc024910c0ed1b52bc4c176c316cd0a14c0f7a6db9cec0"

  url "https://github.com/nipunyatawara-dev/Burrow/releases/download/v#{version}/Burrow-#{version}-#{arch}.dmg"
  name "Burrow"
  desc "Native interface for the Mole maintenance CLI"
  homepage "https://github.com/nipunyatawara-dev/Burrow"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Burrow.app"

  zap trash: [
    "~/Library/Caches/dev.nipunyatawara.burrow",
    "~/Library/Preferences/dev.nipunyatawara.burrow.plist",
    "~/Library/Saved Application State/dev.nipunyatawara.burrow.savedState",
  ]
end
