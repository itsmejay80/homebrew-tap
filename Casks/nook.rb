cask "nook" do
  version "0.1.7"

  on_arm do
    sha256 "b2efb74fc3631fa5899ef07f736fcf79b38380888dd6d6191fa4db76425af542"
    url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "19b05fc3d1291fcd8cb345ce241af9d0b83894b4d94fb7ccdc29e4555b31dd1e"
    url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-x64.dmg"
  end

  name "Nook"
  desc "Local-first, spatial workboard desktop app"
  homepage "https://github.com/itsmejay80/nook"

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
