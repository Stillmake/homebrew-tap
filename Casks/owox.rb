cask "owox" do
  version "1.0.3,9"
  sha256 "5330399dd8e05144baf8751ff26578a2a9e402c968f1f0941e284cefa71f4ed5"

  url "https://github.com/Stillmake/releases/releases/download/owox-#{version.csv.first}-#{version.csv.second}/OwoX.dmg"
  name "OwoX"
  desc "Menu bar proxy client powered by mihomo"
  homepage "https://github.com/Stillmake/releases"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/releases/main/owox/version.json"
    strategy :json do |json|
      json.map { |release| "#{release["version"]},#{release["build"]}" }
    end
  end

  depends_on macos: :sonoma

  app "OwoX.app"

  zap trash: [
    "~/Library/Application Support/OwoX",
    "~/Library/Application Support/com.nobody.OwoX",
    "~/Library/Caches/com.nobody.OwoX",
    "~/Library/HTTPStorages/com.nobody.OwoX",
    "~/Library/Preferences/com.nobody.OwoX.plist",
    "~/Library/Saved Application State/com.nobody.OwoX.savedState",
  ]
end
