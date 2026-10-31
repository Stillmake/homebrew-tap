cask "owox" do
  version "1.0.4,14"
  sha256 "1c2822ae123bc22cf2b353952b5ed69896a05c7a13d30bfafc74a73d34479a92"

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
