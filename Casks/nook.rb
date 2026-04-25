cask "nook" do
  version "0.1.6"

  arch arm: "arm64", intel: "x64"

  url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-#{arch}.dmg"
  name "Nook"
  desc "Local-first, spatial workboard desktop app"
  homepage "https://github.com/itsmejay80/nook"

  sha256 arm:   "aad793756d450c5659212962a004b4a79163aa9b50f89210d2c711e555434d83",
         intel: "6ea84a2bd1367d354d2eed3c6eb35bf567b95119fceca714810ad7c57a3b6421"

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
