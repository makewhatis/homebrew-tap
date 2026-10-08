cask "rhapsody@rc" do
  version "0.3.7-rc.9"
  sha256 "d458e3d45fa8a16282d25782b15e2b3d4af90a24ab57206dab7df633d5dc24ea"

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
