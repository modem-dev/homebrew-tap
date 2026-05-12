class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "b4f131b55f6e3e9c6746e7689801b6cddeb508fc698dfe8e1ac465c1f1da24be"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "e2112575e7605943aced08d1643b9b905662b8ab074538a54a76bd6af16d4af9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "5de8ed2751b7a631db35643148bf810ab89b1dc35adfdb06cc1bf2daa7372654"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.0/hunkdiff-linux-x64.tar.gz"
      sha256 "a7e350b2c52be069063a4a14f64838f26f933dec547f75ba2d8aee35d825b1db"
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
