cask "ocm" do
  version "0.2.1"

  if Hardware::CPU.arm?
    sha256 "29c27f7bf25c131b1439632f1075feaceb2aeccfd2de8ec6a4a0fd139e938b57"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "3b45225f3f94f49a8b88a208ffd3ccbe10d931b76413546d4504153dc63d63de"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_amd64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  end

  name "ocm"
  desc "Interactive TUI for browsing OpenCode sessions"
  homepage "https://github.com/kimoofey/tui"

  binary "ocm"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/ocm"]
  end
end
