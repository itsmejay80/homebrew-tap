cask "nook" do
  version "0.1.5"

  arch arm: "arm64", intel: "x64"

  url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-#{arch}.dmg"
  name "Nook"
  desc "Local-first, spatial workboard desktop app"
  homepage "https://github.com/itsmejay80/nook"

  sha256 arm:   "16183623e36e3dee7bcd63f41818cf84049b5474ab988b55eb56c62fd361efd3",
         intel: "70716f0fa72ba5dc2cdbdff561a5921aa6851c3c699bda7a19f4a432f71795b3"

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
