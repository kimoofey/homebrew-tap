cask "ocm" do
  version "0.2.2"

  if Hardware::CPU.arm?
    sha256 "2a3d2ceb0cb056c40b4d7d751b0b3ac3e9761e4e330799edbc9a73c3a5b99422"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "3dcf36ac89877379059062e7883eea9cae8ba8629b12ec91d91f9e4128714e9a"
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
