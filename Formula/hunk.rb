class Hunk < Formula
  desc "Desktop-inspired terminal diff viewer for agent-authored changesets"
  homepage "https://github.com/modem-dev/hunk"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.0/hunkdiff-darwin-arm64.tar.gz"
      sha256 "641ae3d92ebd3542aa27d8ca9d1eda47248e155e8f762aa7d8cbaf9aec84be42"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.0/hunkdiff-darwin-x64.tar.gz"
      sha256 "9f85c519e14b6957c3013ecb40f9854af799ca1f0cc13b68b62bd005f6d5ba7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.0/hunkdiff-linux-arm64.tar.gz"
      sha256 "695f75d1bc7ef1b1aebe3c144301d25d20bd65c26a77a2d7d2f02fdfb4a94679"
    else
      url "https://github.com/modem-dev/hunk/releases/download/v0.11.0/hunkdiff-linux-x64.tar.gz"
      sha256 "eda5526139e08b40877bd9b48028e1b7c5edde8d030247665a4f21e821cdb7fe"
    end
  end

  def install
    chmod 0755, "hunk"
    libexec.install "hunk"
    (bin/"hunk").write_env_script libexec/"hunk", HUNK_INSTALL_SOURCE: "homebrew"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hunk --version")
  end
end
