class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.1/hunkdiff-darwin-arm64.tar.gz"
      sha256 "3ee44db1d517050e0962b8028ddb0107b51d1cd01e1d4bc0de2e5f4e3b3aae9d"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.1/hunkdiff-darwin-x64.tar.gz"
      sha256 "5ef8279fe0a9b6486cc4036b88e4ababcc052ff31089dad6f169bdfe5e27f78b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.1/hunkdiff-linux-arm64.tar.gz"
      sha256 "9315e74c84d1a746b0b568df92cd34df055e00c8b9b5f298b1bb6b9465781ee2"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.12.1/hunkdiff-linux-x64.tar.gz"
      sha256 "888b356325706acf1a132b9f49630dd849fa6b098a47cc82e27d28f2ef861bc6"
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
