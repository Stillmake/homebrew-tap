cask "actor" do
  version "2.0.1,314"
  sha256 "2c4c69ced54e543947e288fbf890b29fbcea003499b2766b860fc03a157d99be"

  url "https://github.com/Stillmake/ActorApp/releases/download/#{version.csv.first}(#{version.csv.second})/Actor.dmg"
  name "Actor"
  desc "Terminal for agent-driven development"
  homepage "https://actorterm.com/"

  livecheck do
    url "https://raw.githubusercontent.com/Stillmake/ActorApp/main/version.json"
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
