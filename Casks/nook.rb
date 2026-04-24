cask "nook" do
  version "0.1.3"

  arch arm: "arm64", intel: "x64"

  url "https://github.com/itsmejay80/nook/releases/download/v#{version}/Nook-#{version}-#{arch}.dmg",
      verified: "github.com/itsmejay80/nook/"
  name "Nook"
  desc "Local-first, spatial workboard desktop app"
  homepage "https://github.com/itsmejay80/nook"

  sha256 arm:   "448b976208857c370d0958dea250044c35a2dc492182c5b371659473175cb893",
         intel: "da8322b8022e4b16ed1d76b45700396fb8ac738ea5a8e5b9891f0904c7f2bf10"

  app "Nook.app"

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Preferences/com.itsmejay.nook.plist",
    "~/Library/Saved Application State/com.itsmejay.nook.savedState",
    "~/Library/Logs/Nook",
  ]
end
