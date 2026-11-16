class UniCli < Formula
  desc "Command-line client for remote MCP servers"
  homepage "https://github.com/rijieli/linear-cli"
  version "0.5.5"

  on_macos do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "6ed9e95f86c982d18026eeb2a72961780e35ca3149bbefabad9ce9bf84fffe59"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "7c3b6eabfa4615523a1e5bd26e738eb8b52f3e63b64b1a177b96641a7d84bc39"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "13ee7196c3fc5e4e81229425c39475af853ecbc93c232d66a59f52e9b85fabba"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "d91bad8d4b45bd4a530a81009a7911f8bc12f0889b10f30c70ec2e5d8651ed1c"
    end
  end

  def install
    bin.install "uni-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uni-cli --version")
  end
end
