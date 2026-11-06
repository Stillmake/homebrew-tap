class UniCli < Formula
  desc "Command-line client for remote MCP servers"
  homepage "https://github.com/rijieli/linear-cli"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "c38d3d7fe5c632dce2b70d1afd0bdd650cdc117f086a4cf50bf2f267d532f3d4"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "aa3fb8e9a5dac6548770fa38e589517a0e3aeca6f2c904b90e9fecf809ed85d9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "35645e138592d7372c685dc2f1e89c716785954911ce3ea24e87048a7cf7bea7"
    end
    on_intel do
      url "https://github.com/rijieli/uni-cli/releases/download/v#{version}/uni-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "06041e92ab556e1f4aa904b6a0f0a2b1d16d2d6889dd7f17f38fd726c7e8820d"
    end
  end

  def install
    bin.install "uni-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uni-cli --version")
  end
end
