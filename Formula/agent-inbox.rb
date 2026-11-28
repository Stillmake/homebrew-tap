class AgentInbox < Formula
  desc "Lightweight asynchronous mailboxes for coordinating terminal agents"
  homepage "https://github.com/stillmake/agent-inbox"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_arm64.tar.gz"
      sha256 "5ad51af3fc5578aa657db0ef7517ba50ec0ae75c19e4616f0bd83fe0484d5db6"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_amd64.tar.gz"
      sha256 "a4c5b183403996ef14ef71d879bd34ee2e5ab953514f6d9839140a57ab85b35b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_arm64.tar.gz"
      sha256 "d11304631455ee55ff638346045159a76ffdf8b37350452657eff7512d93ebca"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_amd64.tar.gz"
      sha256 "07d64a20283d6fa4fa3b7ceb85fab879afc00db43a04a68ae8c4827ba7371afd"
    end
  end

  def install
    bin.install "agent-inbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-inbox --version")
  end
end
