# Cosmoflare Homebrew formula (ROAD-089).
# Checksums/URLs are updated per release — see README (maintainer section).

class Cosmoflare < Formula
  desc "Go CLI and library for the full Cloudflare developer platform"
  homepage "https://github.com/CosmoLabs-org/cosmoflare"
  url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.1/cosmoflare-v0.28.1-darwin-arm64.tar.gz"
  sha256 "82b8f69ce87d6ed1a5c3a0c9b8a80bba1999620b033c02ca7c54418103875206"
  version "0.28.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.1/cosmoflare-v0.28.1-darwin-arm64.tar.gz"
      sha256 "82b8f69ce87d6ed1a5c3a0c9b8a80bba1999620b033c02ca7c54418103875206"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.1/cosmoflare-v0.28.1-darwin-amd64.tar.gz"
      sha256 "fabeb163312913d7fd2c044ea69fd663785a0d8bedeb237201801efc274b68d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.1/cosmoflare-v0.28.1-linux-arm64.tar.gz"
      sha256 "833fd829df731251cdce961a942b4daddcb70ecddb33d8f1a096b4a56abb504b"
    end
    on_intel do
      url "https://github.com/CosmoLabs-org/cosmoflare/releases/download/v0.28.1/cosmoflare-v0.28.1-linux-amd64.tar.gz"
      sha256 "3b7b40ae4ee0e3cccb7665a1578ececc0f553e02be17155bfb4f893ab601f350"
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
