cask "inline" do
  version "2.0.2,18"
  sha256 "2e9d196a7f547ad8c13f72eebc39fe9eaf979d4ffe5e9e3e27932a48318254e5"

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
