cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.6"
  sha256 arm: "f90a9a3317a1e8232201fd7bf13d029021e7796dd8a6c28c2ffeb58cae24f4f9",
intel: "b3bee4e907ad31b9ccc23fb4ff2c30bc4c689014e15ddeb25820ce7e5a73b386"


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
