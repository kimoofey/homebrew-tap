cask "prq" do
  version "0.3.0"

  if Hardware::CPU.arm?
    sha256 "9785328c080edfa7d6a3962cfb7d7eb6b7afe57afcd79fac6b723c9b0fca6cd5"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "251ea90c5357ba50ca555ea1dc263509ab30b56026e502a2eacfc2bc2e9b692c"
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
