cask "prq" do
  version "0.1.1"

  if Hardware::CPU.arm?
    sha256 "01fcd166194a10178c1162be0989cc2c07d9722d404a78df5369b5d110462ad4"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "a703e08fe55158ad3e35f7d9a9fe604adb6a4166a30e1a86bc1c691c33045979"
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
