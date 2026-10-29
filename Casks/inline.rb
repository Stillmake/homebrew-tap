cask "inline" do
  version "2.1,21"
  sha256 "99a86d225e7b82f5953143b5f5ffdbaf32ce7aab4a005be9ab9b5f5634cfcbfa"

  url "https://github.com/Stillmake/releases/releases/download/inline-#{version.csv.first}-#{version.csv.second}/Inline.dmg"
  name "Inline"
  desc "Inline writing and dictionary assistant"
  homepage "https://github.com/Stillmake/releases"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/releases/main/inline/version.json"
    strategy :json do |json|
      json.map { |release| "#{release["version"]},#{release["build"]}" }
    end
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
