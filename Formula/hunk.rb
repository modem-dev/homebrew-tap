class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.16.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "1143eb8bcbdf64cd1dea9d94cb2ed2757810c384b36477495b7045ef0492be96"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.16.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "d9dada9de5f1ab060a081082e272a3143af5f6992ce52cb46b7b211a26279f72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.16.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "7e2e64ecdefec7fb024a7772ea0bb620d4014203613e7bd4638043ad6be2eee3"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.16.0/hunkdiff-linux-x64.tar.gz"
      sha256 "0dd80c7679265df72617877a02dafefd6ac6a834528e10257567642eb2c05ea6"
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
