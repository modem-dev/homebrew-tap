class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.3/hunkdiff-darwin-arm64.tar.gz"
      sha256 "e301a78dc524cb928fc74ee459c2bb2db521538975ebe4191f597d50987eaa8b"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.3/hunkdiff-darwin-x64.tar.gz"
      sha256 "aa029d94936f5ac243b56f07911ef8ab9a96047df7519059e2e5f74eeccfbfcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.3/hunkdiff-linux-arm64.tar.gz"
      sha256 "cde829d78a480ba6ce76c41b6defc8fc1e6f58ba3ce5c09d4c136b310c3d14f2"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.15.3/hunkdiff-linux-x64.tar.gz"
      sha256 "70895b5224a0beb09ac3ff1bc7ff442c32fa5e017649af71b45221bf829c0b5b"
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
