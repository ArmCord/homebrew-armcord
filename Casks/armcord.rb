cask "armcord" do

  arch arm: "arm64", intel: "x64"


  version "3.3.0"
  sha256 arm: "d339f16df619018520e484bec1dffddbc571b5d3688090dd9fb17ea32367322e",
intel: "c8e88773707cc4427ac46104bfb4d4e4d89b8d628f8cc13ecc2dc05784c2ddbd"


  url "https://github.com/ArmCord/ArmCord/releases/download/v#{version}/ArmCord-#{version}-mac-#{arch}.dmg",
      verified: "github.com/ArmCord/ArmCord/"
  name "armcord"
  desc "Custom lightweight Discord client designed to enhance your experience"
  homepage "https://armcord.app/"

  app "armcord.app"

  postflight do
    `codesign --force --deep --sign - "#{appdir}/armcord.app"`
    `xattr -r -d com.apple.quarantine "#{appdir}/armcord.app"`
  end

  zap trash: [
    "~/Desktop/armcord",
    "~/Library/Application Support/ArmCord",
    "~/Library/Preferences/com.smartfridge.armcord.plist",
    "~/Library/Saved Application State/com.smartfridge.armcord.savedState",
  ]
end
