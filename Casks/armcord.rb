cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.4"
  sha256 arm: "a246a1559bcdc4c4243c7544fec7968caf6f6415e0eb442a9a2348332de8a04c",
intel: "1825666f20aa3406b14b405d083d587676f9898d4c55de5353804a8969163459"


  url "https://github.com/ArmCord/ArmCord/releases/download/v#{version}/ArmCord-#{version}#{arch}.dmg",
      verified: "github.com/ArmCord/ArmCord/"
  name "armcord"
  desc "Custom lightweight Discord client designed to enhance your experience"
  homepage "https://armcord.app/"

  app "armcord.app"

  postflight do
    `codesign --force --deep --sign - "#{appdir}/webcord.app"`
    `xattr -r -d com.apple.quarantine "#{appdir}/webcord.app"`
  end

  zap trash: [
    "~/Desktop/armcord",
    "~/Library/Application Support/ArmCord",
    "~/Library/Preferences/com.smartfridge.armcord.plist",
    "~/Library/Saved Application State/com.smartfridge.armcord.savedState",
  ]
end
