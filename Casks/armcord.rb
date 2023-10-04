cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.4-libwebp"
  sha256 arm: "37d1d694912f18c32a2db63111fa969fcfbce6c8e0a25811fde1daee5f77d100",
intel: "b078b8370a399a7aead2ceac12e4fd9ce2ab2e592ab2db83791943d08f506b16"


  url "https://github.com/ArmCord/ArmCord/releases/download/v#{version}/ArmCord-#{version.sub(%r{-libwebp}, '')}#{arch}.dmg",
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
