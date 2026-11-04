class UniCli < Formula
  desc "Command-line client for remote MCP servers"
  homepage "https://github.com/rijieli/linear-cli"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "4e66868bbec465cc1a2fd92d2b595ae088f60e529b6a6f1c09c9a4f24def9084"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "0649253549cb5635b3056964c2e8844f4c0d84d937cc97789f5399d7c531fadd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "6cd013fbcb47094ee1cba7e32eeb2dc876f888607aecb0d2d38ebb06bee40c8d"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "c6fe882990736350cf6912f6213fd1798f65800af8ff4339e0a1d8b12c1afb5e"
    end
  end

  def install
    bin.install "uni-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uni-cli --version")
  end
end
