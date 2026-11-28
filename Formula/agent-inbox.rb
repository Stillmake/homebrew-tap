class AgentInbox < Formula
  desc "Lightweight asynchronous mailboxes for coordinating terminal agents"
  homepage "https://github.com/stillmake/agent-inbox"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_arm64.tar.gz"
      sha256 "afe209f52eea7b6d4148da49367175062490c05593d72bc33ab950de76e33834"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_amd64.tar.gz"
      sha256 "7b911fc45c04e8042f53e5f6caf76b01b2996a580006eab89d5e5440c7a8a4ec"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_arm64.tar.gz"
      sha256 "730e61ac485e1c27ea2da951e81d532104c9f34da0c15605f785f39a3fa1e2e7"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_amd64.tar.gz"
      sha256 "4457a87f6974bcf4a7aa8f55262ac1a12f71470e469397105fd7410dbcbb9b95"
    end
  end

  def install
    bin.install "agent-inbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-inbox --version")
  end
end
