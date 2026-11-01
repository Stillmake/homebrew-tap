cask "actor" do
  version "2.3,373"
  sha256 "093965165c3616ea52f28176b7c8b223443cc256dcc86c42118ab5851e273840"

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
