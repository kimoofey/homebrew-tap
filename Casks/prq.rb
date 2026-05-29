cask "prq" do
  version ".0.1.1"

  if Hardware::CPU.arm?
    sha256 "733bf07e0c0e696a8dd33ff9f5556655acc97f3d611512dce56b3bf70aae3390"
    url "https://github.com/kimoofey/tui/releases/download/prq/v#{version}/prq_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "9caa18f2996376c8bb90093d323a3ae8d07a8f185f1dbb50a02a85158cd3a0cd"
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
