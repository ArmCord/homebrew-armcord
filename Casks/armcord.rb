cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.5"
  sha256 arm: "c697a9336304fdedd429d5c990c57a783d578aad2ff19c3501297aec12338e2d",
intel: "25676f333becaf6222ae2e1086e568656548e836d91d7ad2e6cf1723d93e7710"


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
