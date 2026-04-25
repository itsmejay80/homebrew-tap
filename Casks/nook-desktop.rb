cask "nook-desktop" do
  version "0.1.8"

  on_arm do
    sha256 "497eb8cb2357a6036b2bc26dcf61ebc72b4392f5186e0f415fb4a6f447764bb1"
    url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "b2ff0814ba087ef9aafea6b5229cbaf6ea9d22030fb65185bbcab46e567aea8a"
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
