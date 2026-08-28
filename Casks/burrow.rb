cask "burrow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0"
  sha256 arm:   "36c3e44d204c260ff2c79209b793df2b460c8dd917e14f120d0156d4a6b4c7c8",
         intel: "0b8f000b23d3dc06e263cdf0669305994e05c05ff9f368c10990f10b5aa3d288"

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
