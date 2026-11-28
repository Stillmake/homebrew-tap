class AgentInbox < Formula
  desc "Lightweight asynchronous mailboxes for coordinating terminal agents"
  homepage "https://github.com/stillmake/agent-inbox"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_arm64.tar.gz"
      sha256 "8218690623eac6a7aef5638736dad7f01bfaacbd9e1911b4b75586af6265aa3a"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_amd64.tar.gz"
      sha256 "8ae664eb788382272babbefe4641bfdb4e62e86eecc8164d65aea4e09099bee4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_arm64.tar.gz"
      sha256 "1702cde83b7d11bc29cf6298e255ceb50d2dfe152532757745e9bd1077141df6"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_amd64.tar.gz"
      sha256 "2e680c440b4463165f65b10ee87d0a60a1c0eeaa49707cab8d46ac2ce75563f3"
    end
  end

  def install
    bin.install "agent-inbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-inbox --version")
  end
end
