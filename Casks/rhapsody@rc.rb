cask "rhapsody@rc" do
  version "0.3.4-rc.16"
  sha256 "fddebafbd895cd5a015904ef1c56b59e1eecf615e6490052eb7d68083dc2ee79"

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
