cask "nook" do
  version "0.1.7"

  arch arm: "arm64", intel: "x64"

  url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-#{arch}.dmg"
  name "Nook"
  desc "Local-first, spatial workboard desktop app"
  homepage "https://github.com/itsmejay80/nook"

  sha256 arm:   "b2efb74fc3631fa5899ef07f736fcf79b38380888dd6d6191fa4db76425af542",
         intel: "19b05fc3d1291fcd8cb345ce241af9d0b83894b4d94fb7ccdc29e4555b31dd1e"

  app "Nook.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nook.app"]
  end

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Preferences/com.itsmejay.nook.plist",
    "~/Library/Saved Application State/com.itsmejay.nook.savedState",
    "~/Library/Logs/Nook",
  ]
end
