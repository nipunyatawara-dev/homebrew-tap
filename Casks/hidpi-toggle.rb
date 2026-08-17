cask "hidpi-toggle" do
  version "3.0"
  sha256 "116498b21f6ea33ec28c7a8ac7cc209a5c646a619458f90460e50494b15e314b"

  url "https://github.com/nipunyatawara-dev/HiDPI-Toggle/releases/download/v#{version}/HiDPIToggle-v#{version}.dmg"
  name "HiDPI Toggle"
  desc "Menu bar app for external display HiDPI scaling, resolution, and refresh rate"
  homepage "https://github.com/nipunyatawara-dev/HiDPI-Toggle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "HiDPIToggle.app"

  zap trash: "~/Library/Preferences/com.local.hidpitoggle.plist"

  caveats <<~EOS
    HiDPI Toggle is ad-hoc signed. If macOS blocks it on first launch, run:
      xattr -cr /Applications/HiDPIToggle.app
  EOS
end
