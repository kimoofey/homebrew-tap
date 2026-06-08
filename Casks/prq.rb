cask "prq" do
  version "0.2.1"

  if Hardware::CPU.arm?
    sha256 "e89e01fb3f8c35db3bd0164810548aeca78f1a11f4de3a0d8d923609e34bd9ad"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "db08099cff08ce48cea82df5f4b22e08c59fcdfa4339501acb28309ac7965e5a"
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
