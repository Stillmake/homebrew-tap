class UniCli < Formula
  desc "Command-line client for remote MCP servers"
  homepage "https://github.com/rijieli/linear-cli"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "859c2d59fc009d11aa8f006b2c842cba7ed82942ff8b4def1fe85ffc2b681629"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "fddedcbca25ad15d64064e2aee97af3e4504ee20006a701f2fd93fe6c8d48d97"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "b5af848e4f6936972499056f38491550134bbf72e0b2db390ecc269e5aa26c67"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "185364d3dd3795ae56bbaf65c0cb16e73dd43c9e74c0cc3d0aa5aa5936ccea0d"
    end
  end

  def install
    bin.install "uni-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uni-cli --version")
  end
end
