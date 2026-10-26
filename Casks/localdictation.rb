cask "localdictation" do
  version "0.3.0,1"
  sha256 "a4b785a7f76f5b846b1dafd6bc6aaed106e267846e8f5e90634223b13677c6d6"

  url "https://github.com/Stillmake/releases/releases/download/localdictation-#{version.csv.first}-#{version.csv.second}/LocalDictation.dmg"
  name "LocalDictation"
  desc "On-device speech-to-text"
  homepage "https://github.com/Stillmake/releases"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/releases/main/localdictation/version.json"
    strategy :json do |json|
      json.map { |release| "#{release["version"]},#{release["build"]}" }
    end
  end

  depends_on macos: :tahoe

  app "LocalDictation.app"

  zap trash: [
    "~/Library/Application Support/com.stillmake.localdictation",
    "~/Library/Caches/com.stillmake.localdictation",
    "~/Library/HTTPStorages/com.stillmake.localdictation",
    "~/Library/Preferences/com.stillmake.localdictation.plist",
    "~/Library/Saved Application State/com.stillmake.localdictation.savedState",
  ]
end
