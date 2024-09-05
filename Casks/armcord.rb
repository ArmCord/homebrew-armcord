cask "armcord" do

  arch arm: "arm64", intel: "x64"


  version "3.3.1"
  sha256 arm: "b632d85f29fca60f66a91155d338f280ab3cda02a89ec2cafe669d8211dd43d3",
intel: "b686e4f6aeb1f75b9c6d8617d6bed6abf49feb4b965da2616b50e8a07e4912e3"


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
