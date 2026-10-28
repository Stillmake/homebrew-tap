cask "moof" do
  version "1.0,29"
  sha256 "fa3b4aee2fa5a51ab71c495b86fa7b3aa52b1325f3b1dd5829a3355c968417a5"

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
