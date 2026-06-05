cask "prq" do
  version "0.2.0"

  if Hardware::CPU.arm?
    sha256 "c589e1f3f4e92cf708f7b8f94634598e407a5b51746c40c90c69fa3662fefab3"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "0a1522b1d55374654f7f092c890fca52566eb8d264994297be084874bc307531"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_amd64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  end

  name "prq"
  desc "Interactive TUI for GitHub PR review queue"
  homepage "https://github.com/kimoofey/tui"

  depends_on formula: "gh"

  binary "prq"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/prq"]
  end
end
