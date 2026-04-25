cask "nook" do
  version "0.1.8"

  on_arm do
    sha256 "ead7ffbb288402ec7dc49b64a988f49155e7a0ce82d9c9cb2b1294bb8a8cea35"
    url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "510592b5dab40836bf92021a268fb29e0b9b79c3ece180d6fb25c9aeab2c760b"
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
