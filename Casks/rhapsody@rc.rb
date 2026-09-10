cask "rhapsody@rc" do
  version "0.3.4-rc.21"
  sha256 "4d8f4c201dbd7c9eadba3cf321cacc3866d90041eb16ef1340ca1fa528015c1e"

  url "https://github.com/makewhatis/rhapsody/releases/download/v#{version}/Rhapsody.dmg"
  name "Rhapsody"
  desc "Supervises the rhapsodyd daemon and shows its dashboard"
  homepage "https://github.com/makewhatis/rhapsody"

  auto_updates true
  conflicts_with cask: "rhapsody"
  depends_on macos: :big_sur

  app "Rhapsody.app"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "is.makewhat.rhapsody"],
        must_succeed: false,
      },
      trash:  "~/.rhapsody"
end
