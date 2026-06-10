class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.1/hunkdiff-darwin-arm64.tar.gz"
      sha256 "0a3ccde32896fa0ce37e1d64e4904a2979cbeb27a9a1efabc5244f003f3ea798"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.1/hunkdiff-darwin-x64.tar.gz"
      sha256 "3b0da4425eb8d40873b67dd120d79f3661e014f3a7ada5914ce8b70a311fd8be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.1/hunkdiff-linux-arm64.tar.gz"
      sha256 "1ccd2ca3d4fbeeb037eb8073a1abb5fd2c6e0e23ed3cd1dcfffc3709d95edba2"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.1/hunkdiff-linux-x64.tar.gz"
      sha256 "1d659787577c8f624fc955afd942d1024ac7fb03532fbf889d2f26024af96bf9"
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
