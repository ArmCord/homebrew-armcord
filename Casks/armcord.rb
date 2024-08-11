cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.8"
  sha256 arm: "c7e10df830b8a49cf8f79e5b9479d52e8a6902359526607956096e6b980dce3a",
intel: "b5e1e6b0283d985f7fbc072ab1c518bebfe5760b60d82fe0d3ab21fc340185a6"


  url "https://github.com/ArmCord/ArmCord/releases/download/v#{version}/ArmCord-#{version}#{arch}.dmg",
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
