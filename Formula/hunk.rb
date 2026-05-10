class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.1/hunkdiff-darwin-arm64.tar.gz"
      sha256 "4e34ab0f11e36176ac5c4afe3b436277d3dc251bd921b44afe53fb0eb187b59a"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.1/hunkdiff-darwin-x64.tar.gz"
      sha256 "76af03edaeacd0c508013ab6b60322d15608a74d2a5aa2cd75d89494851c6b3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.1/hunkdiff-linux-arm64.tar.gz"
      sha256 "bc5cc05bee9f5e3ea43569bb57b3a3e3a17cc5f8cb32cb2b5ad8b5e7cb90f1e7"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.1/hunkdiff-linux-x64.tar.gz"
      sha256 "5d0921517c40f55b1dd482e0ca8ddc46aace4df60d815494ca263d6674187214"
    end
  end

  def install
    chmod 0755, "hunk"
    libexec.install "hunk"
    (bin/"hunk").write_env_script libexec/"hunk", HUNK_INSTALL_SOURCE: "homebrew"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hunk --version")
  end
end
