class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.2/hunkdiff-darwin-arm64.tar.gz"
      sha256 "2c4c13a10acfd2589af92e80e25b6c0445fd62400dfb68e5632933f8a7fc44d7"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.2/hunkdiff-darwin-x64.tar.gz"
      sha256 "52b9a0e018260ed7d4ac8bdaf0794f7bd8173b7fa82ebce061c14c85d9d071b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.2/hunkdiff-linux-arm64.tar.gz"
      sha256 "c6faa74cf8e69bed9767cd66cc9d631575d9393c949b10cc522098cd77881e1c"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.2/hunkdiff-linux-x64.tar.gz"
      sha256 "d0d91f890e6ec8272a91e0a345cedc2d3c32328b7fa683ccb651ee9fe6f77fe8"
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
