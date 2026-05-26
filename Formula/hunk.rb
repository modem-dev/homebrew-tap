class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "b46f6446f9baf6604e370d64cfc37764e35c5ca2eed496b537e4817d0492c6f9"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "fc22b4c6a6542a4470728475d8c4c772b2d383146b9b1732f589e2f1021acb5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "05bab97bb639db880b822c202cf259787598e3d679517e765bcbbae1655b63e5"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.0/hunkdiff-linux-x64.tar.gz"
      sha256 "7fcfd1d0e01a24648946aedbf571e26256601e72d3c6ecf61a67eb63449680e8"
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
