class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "f851fb247c9a60607f3fc6fc0c94c1b62e6050d9184d8e1b323bd42b6291a346"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "7a9967b5804a9d9a4a7ddb7ee6e1dfd64a266ce06aed256ff643607b850c93cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "4eedbcce7124e2b575e8b4c53e4c8ea2200866264647b50fb96fd91c0329befd"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.13.0/hunkdiff-linux-x64.tar.gz"
      sha256 "230756efccb4c82e3d495f28caeff10d82555eda2a058fb610d988b84cf15461"
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
