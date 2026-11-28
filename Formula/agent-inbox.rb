class AgentInbox < Formula
  desc "Lightweight asynchronous mailboxes for coordinating terminal agents"
  homepage "https://github.com/stillmake/agent-inbox"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_arm64.tar.gz"
      sha256 "70f8ad9e9259ab5e2c37e7188f99d2f951d983c6c39a828910c3264902c8fafa"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_darwin_amd64.tar.gz"
      sha256 "e3aa64acdb62e35874404aab9f4e01ec079244f4552dc68d18ba8cc6485d4f79"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_arm64.tar.gz"
      sha256 "706b49236884c07532cfb14d31cdb7339fb3d944eb5fb82eae2d4457ce07a43b"
    end
    on_intel do
      url "https://github.com/stillmake/agent-inbox/releases/download/v#{version}/agent-inbox_v#{version}_linux_amd64.tar.gz"
      sha256 "74e41794f6bcc566634a54047d02b22e93bfd9f9bc34e93c9c7d72065426b1e3"
    end
  end

  def install
    bin.install "agent-inbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-inbox --version")
  end
end
