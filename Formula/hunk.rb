class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.13.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.2/hunkdiff-darwin-arm64.tar.gz"
      sha256 "73748465d2deed21df009e714002a2773c1a6b2e83f74aa7c31fb63806d19984"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.2/hunkdiff-darwin-x64.tar.gz"
      sha256 "fd108a1e82b7b1a2d292c57bf9103dcf45fd167d393e1cc7f65b28526ab6ad77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.2/hunkdiff-linux-arm64.tar.gz"
      sha256 "9b28b8a81c07d18328cea5d3537f9d8a58c54e34a10e1bde20b700b323d8a452"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.2/hunkdiff-linux-x64.tar.gz"
      sha256 "3dc915f7646405645dd2e9371ca6b964a5184fee26f6c4a07c727428e5446392"
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
