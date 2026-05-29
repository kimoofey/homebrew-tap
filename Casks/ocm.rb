cask "ocm" do
  version ".0.1.1"

  if Hardware::CPU.arm?
    sha256 "bf83d844a3668bdb1d3e0bf58f6666ab863c480fe48853082211be2c026891bf"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "a63ca6bc8a90153aadc57db02ce5f35a4c720a3628ebc7db16c0d39574df32c5"
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
