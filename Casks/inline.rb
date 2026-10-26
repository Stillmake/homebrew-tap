cask "inline" do
  version "2.0.1"
  sha256 "21a6de0a33b09493ae88fb4d17e7e894cb23ec2fcdd3de00bd09a789832c76de"

  url "https://github.com/Stillmake/Inline-Release/releases/download/#{version}/Inline.dmg"
  name "Inline"
  desc "Inline writing and dictionary assistant"
  homepage "https://github.com/Stillmake/Inline-Release"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Inline.app"

  zap trash: [
    "~/Library/Application Support/com.ideasform.Inline",
    "~/Library/Caches/com.ideasform.Inline",
    "~/Library/HTTPStorages/com.ideasform.Inline",
    "~/Library/Preferences/com.ideasform.Inline.plist",
    "~/Library/Saved Application State/com.ideasform.Inline.savedState",
  ]
end
