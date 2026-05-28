cask "ocm" do
  version "0.1.0"

  if Hardware::CPU.arm?
    sha256 "26cf63b9f7fc2dd698edacdaadfd539c5d1da6919677d33b1725102019989b87"
    url "https://github.com/kimoofey/tui/releases/download/ocm/v#{version}/ocm_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/kimoofey/tui/"
  else
    sha256 "53456e5c1c081ce7681cf84bdd91c428523ed8e722b3f1a8fcf0dcc885ade901"
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
