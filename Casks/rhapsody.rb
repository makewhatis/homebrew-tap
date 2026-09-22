cask "rhapsody" do
  version "0.3.6"
  sha256 "68201e37134e06ee14df54de4fcaea679b164156f676789a3d4c90571c9fe945"

  url "https://github.com/makewhatis/rhapsody/releases/download/v#{version}/Rhapsody.dmg"
  name "Rhapsody"
  desc "Supervises the rhapsodyd daemon and shows its dashboard"
  homepage "https://github.com/makewhatis/rhapsody"

  auto_updates true
  depends_on macos: :big_sur

  app "Rhapsody.app"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "is.makewhat.rhapsody"],
        must_succeed: false,
      },
      trash:  "~/.rhapsody"
end
