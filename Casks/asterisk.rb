cask "asterisk" do
  version "0.1.5"
  sha256 "348490cab8e7e71fa990207261cfcba843d88c1cd5fefeb8be40c17e2669b4b5"

  url "https://github.com/Stillmake/AsteriskApp/releases/download/#{version}/Asterisk.dmg"
  name "Asterisk"
  desc "Chat client for multiple LLM providers"
  homepage "https://github.com/Stillmake/AsteriskApp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Asterisk.app"

  zap trash: [
    "~/Library/Application Support/Asterisk",
    "~/Library/Caches/com.stillmake.asterisk",
    "~/Library/HTTPStorages/com.stillmake.asterisk",
    "~/Library/Preferences/com.stillmake.asterisk.plist",
    "~/Library/Saved Application State/com.stillmake.asterisk.savedState",
  ]
end
