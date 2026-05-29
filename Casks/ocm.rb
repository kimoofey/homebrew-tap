cask "ocm" do
  version "0.1.1"

  if Hardware::CPU.arm?
    sha256 "95c0b38ac26243323fb1a2e901fec31c893fadcd6168b79468a78f5890e7fa9d"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "9f986e212f3d243f8b1d96af3c1a4c1cdff28e755dab33e4ee7f0348562cbf14"
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
