cask "shotpark" do
  version "1.8.0"
  sha256 "ec52902dcf5f878437b0c43f092fb405c1f24884244e67a80526c5517f49ee1b"

  url "https://github.com/chiyodad/shotpark/releases/download/v#{version}/ShotPark-#{version}.zip"
  name "ShotPark"
  desc "Region screenshot, annotation and sharing tool for macOS"
  homepage "https://shotpark.site/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "ShotPark.app"

  caveats <<~EOS
    ShotPark is not notarized. Install with --no-quarantine to skip the Gatekeeper prompt:
      brew install --cask --no-quarantine chiyodad/tap/shotpark
    First capture asks for Screen Recording permission; enable ShotPark, then quit and relaunch it once.
  EOS

  zap trash: [
    "~/Library/Preferences/ai.worxphere.suseok.shotpark.plist",
  ]
end
