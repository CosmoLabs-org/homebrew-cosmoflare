# Cosmoflare Homebrew formula (ROAD-089).
# Checksums/URLs are updated per release — see README (maintainer section).

class Cosmoflare < Formula
  desc "Go CLI and library for the full Cloudflare developer platform"
  homepage "https://github.com/CosmoLabs-org/cosmoflare"
  url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.29.0/cosmoflare-v0.29.0-darwin-arm64.tar.gz"
  sha256 "637712d309a5f75ce0a34004f44abdf505a088ae5ff08c9426186be5c8c93005"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.29.0/cosmoflare-v0.29.0-darwin-arm64.tar.gz"
      sha256 "637712d309a5f75ce0a34004f44abdf505a088ae5ff08c9426186be5c8c93005"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.29.0/cosmoflare-v0.29.0-darwin-amd64.tar.gz"
      sha256 "a33dcbbffd6f341fe2312b616e1a4d343cc783c43ee716bc8d3675f225544168"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.29.0/cosmoflare-v0.29.0-linux-arm64.tar.gz"
      sha256 "7f568cfd5f1186e27d3f2c18b695e88c3cba72fce55198730c13d5e88e624ff2"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.29.0/cosmoflare-v0.29.0-linux-amd64.tar.gz"
      sha256 "38f9253dfe6cede9c2a590417c1d4ac0104c53219fb50f040863a9714637292d"
    end
  end

  def install
    bin.install "cosmoflare"
  end

  def caveats
    <<~EOS
      Set CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID, or run
      `cosmoflare config init` for the interactive setup wizard.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cosmoflare --version")
  end
end
