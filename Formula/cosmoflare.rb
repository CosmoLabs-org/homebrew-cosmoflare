# Cosmoflare Homebrew formula (ROAD-089).
# Checksums/URLs are updated per release — see README (maintainer section).

class Cosmoflare < Formula
  desc "Go CLI and library for the full Cloudflare developer platform"
  homepage "https://github.com/CosmoLabs-org/cosmoflare"
  url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.2/cosmoflare-v0.28.2-darwin-arm64.tar.gz"
  sha256 "47dece786610a64c4cfdf44e597511a054f8574f52abb1b8bb9d8b96605be241"
  version "0.28.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.2/cosmoflare-v0.28.2-darwin-arm64.tar.gz"
      sha256 "47dece786610a64c4cfdf44e597511a054f8574f52abb1b8bb9d8b96605be241"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.2/cosmoflare-v0.28.2-darwin-amd64.tar.gz"
      sha256 "d25990399bf69a209f67d305c252db68d6ab2decb2de05687947c404aae39867"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.2/cosmoflare-v0.28.2-linux-arm64.tar.gz"
      sha256 "e6f0cfe94cab8a1882f29f0be6becb438c57808d049080604e6d531eda549c6a"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.2/cosmoflare-v0.28.2-linux-amd64.tar.gz"
      sha256 "59d2be4ed1e3576e86fa14f4b56f49791c3103692a3349d9a1c9f0637ba0eebf"
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
