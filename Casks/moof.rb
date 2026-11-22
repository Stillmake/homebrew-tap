cask "moof" do
  version "1.1.3,47"
  sha256 "1b881d73460c5f1c6d18f28432eb35f29a896fd17147553e4f48f40aa721999b"

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
