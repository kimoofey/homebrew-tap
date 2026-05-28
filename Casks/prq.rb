cask "prq" do
  version "0.1.0"

  if Hardware::CPU.arm?
    sha256 "2d0aea66a3b208b59532484b105b41cb9fdb97c03682e3ddc26fc60a65c676f6"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "1656ffee2a75e4a200cb3ccdc78608b1e8188e7e3470bea5d3b89ca255bc1c0a"
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
