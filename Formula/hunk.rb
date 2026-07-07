class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.17.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "700221669a51b78c835985b49ca67e5a4bbaafdb434a6ca03f9d262f7a82693e"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.17.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "636e09c59a7481d7a12fbc2f0dc54acfbc0286813604d86a52b3644739222624"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.17.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "46164126148b7fb459c15fb9a92193917da5b7a5c509b4b36a2dcdf3ab04f4db"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.17.0/hunkdiff-linux-x64.tar.gz"
      sha256 "0c626f7a6687a9826304ea1df696da5d49edf84271eccdf57ffff5834289e0e2"
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
