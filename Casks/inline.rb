cask "inline" do
  version "2.1.1,24"
  sha256 "08bc790cc110552f7b223dda9854ce9f2fd6f14b55879e87933c7ba7fe784ec0"

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
