class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.1/hunkdiff-darwin-arm64.tar.gz"
      sha256 "e55ff1e6118e0e94c87f4c73a7ce26540f7bd86a063f3a47f89787a06db08cd6"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.1/hunkdiff-darwin-x64.tar.gz"
      sha256 "c4f1df75c3e53b30be37f51437aab9ddf8cd391c5a2dcf3ade800d294d475ceb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.1/hunkdiff-linux-arm64.tar.gz"
      sha256 "29611666c5b3f0ddea7859062aa0adeb171e5713043d4cea8c63b1a856f3525f"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.1/hunkdiff-linux-x64.tar.gz"
      sha256 "9b0b49c96b6c6ea7a31fb90c1311323913cb81c01f780f146fda1eceb142a7d0"
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
