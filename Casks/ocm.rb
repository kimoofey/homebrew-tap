cask "ocm" do
  version "0.2.0"

  if Hardware::CPU.arm?
    sha256 "bb627df963c1f6b2da8206f2fbfa964a347f0bb309275e35fd7f6ae58c40bfa6"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "aea1cb63d498fc9c664055901a8f26d7f6b2b0f7d0ff9b3ed5b4aaf03192bd4b"
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
