cask "moof" do
  version "1.1,37"
  sha256 "0e491d34a99ce87df86def5a0d9a2a725ca65330e3fa586f2ac25130060a3381"

  url "https://github.com/Stillmake/releases/releases/download/moof-#{version.csv.first}-#{version.csv.second}/Moof.dmg"
  name "Moof"
  desc "Menu bar app for floating notification cards"
  homepage "https://github.com/Stillmake/releases"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/releases/main/moof/version.json"
    strategy :json do |json|
      json.map { |release| "#{release["version"]},#{release["build"]}" }
    end
  end

  depends_on macos: :tahoe

  app "Moof.app"

  zap trash: [
    "~/Library/Application Support/com.stillmake.Moof",
    "~/Library/Caches/com.stillmake.Moof",
    "~/Library/HTTPStorages/com.stillmake.Moof",
    "~/Library/Preferences/com.stillmake.Moof.plist",
    "~/Library/Saved Application State/com.stillmake.Moof.savedState",
  ]
end
