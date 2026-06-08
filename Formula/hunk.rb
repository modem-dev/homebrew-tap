class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "7c9df4103786bdc697e7ef308baaccb57adc3d4f9bf2b66337b5c78e39e3fd25"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "381da3b96f9ac9d4cfd83680af8f9edd4d8c3281edd0f88095333f0c129a0d9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "fea19d499813ec8f898f3f4e194b917ddf622d59268fce7d1facc9f5e63af7ee"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.0/hunkdiff-linux-x64.tar.gz"
      sha256 "a9ae8ac67c459cf192409a40481aa237aa40507560daf6c6109b328a4e01a8df"
    end
  end

  def install
    chmod 0755, "hunk"
    libexec.install "hunk"
    libexec.install "skills"
    (bin/"hunk").write_env_script libexec/"hunk", HUNK_INSTALL_SOURCE: "homebrew"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hunk --version")
  end
end
