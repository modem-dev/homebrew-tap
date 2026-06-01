class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.1/hunkdiff-darwin-arm64.tar.gz"
      sha256 "9e8b03fb66e3e0fa125fe7d04b0fd7f5cb7ef3f734ee9f38d3007d150a77991f"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.1/hunkdiff-darwin-x64.tar.gz"
      sha256 "5e06aa15218959f1038fd5515705efa0df6a681858c410eeba800476f7fc14d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.1/hunkdiff-linux-arm64.tar.gz"
      sha256 "0000495fab0405f4469f67f8ea33db9066f009972f7044f321750a6d19de1c4e"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.14.1/hunkdiff-linux-x64.tar.gz"
      sha256 "7a79a1203e8be2dafcf8a0e0be2f17bc984cb050be195a0710a8776244aa88fe"
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
