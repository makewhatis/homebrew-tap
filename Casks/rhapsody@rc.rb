cask "rhapsody@rc" do
  version "0.3.4-rc.2"
  sha256 "71ad5f17c4f1af965a2cbc344d0d3957fe8d1c724ee4acdac23f0e1ce2023dc9"

  url "https://github.com/makewhatis/rhapsody/releases/download/v#{version}/Rhapsody.dmg"
  name "Rhapsody"
  desc "Supervises the rhapsodyd daemon and shows its dashboard"
  homepage "https://github.com/makewhatis/rhapsody"

  auto_updates true
  conflicts_with cask: "rhapsody"
  depends_on macos: :catalina

  app "Rhapsody.app"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "is.makewhat.rhapsody"],
        must_succeed: false,
      },
      trash:  "~/.rhapsody"
end
