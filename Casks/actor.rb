cask "actor" do
  version "2.8,439"
  sha256 "ade289d3c01caaebb789dd6c80e4fcc251f4abf737cab6f6e7d089fb3f554dda"

  url "https://github.com/Stillmake/releases/releases/download/actor-#{version.csv.first}-#{version.csv.second}/Actor.dmg"
  name "Actor"
  desc "Terminal for agent-driven development"
  homepage "https://stillmake.com/actor"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/releases/main/actor/version.json"
    strategy :json do |json|
      json.map { |release| "#{release["version"]},#{release["build"]}" }
    end
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Actor.app"

  zap trash: [
    "~/Library/Application Support/com.stillmake.actor",
    "~/Library/Caches/com.stillmake.actor",
    "~/Library/HTTPStorages/com.stillmake.actor",
    "~/Library/Preferences/com.stillmake.actor.plist",
    "~/Library/Saved Application State/com.stillmake.actor.savedState",
  ]
end
