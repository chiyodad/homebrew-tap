cask "shotpark" do
  version "1.9.4"
  sha256 "60084b2e342a5f01057f708fa311ec93893c0af7a75105d3a3473871780a3593"

  url "https://github.com/chiyodad/shotpark/releases/download/v#{version}/ShotPark-#{version}.zip"
  name "ShotPark"
  desc "Region screenshot, annotation and sharing tool for macOS"
  homepage "https://shotpark.site/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "ShotPark.app"

  # Not notarized: clear the quarantine flag so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ShotPark.app"],
                   must_succeed: false
  end

  caveats <<~EOS
    First capture asks for Screen Recording permission: enable ShotPark in
    System Settings → Privacy & Security → Screen & System Audio Recording, then quit and relaunch it once.
  EOS

  zap trash: [
    "~/Library/Preferences/ai.worxphere.suseok.shotpark.plist",
  ]
end
