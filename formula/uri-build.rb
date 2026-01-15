class UriBuild < Formula
  desc "PR rebuild monitor that comments #rebuild when Falcon CI requests it"
  homepage "https://github.com/"

  url "https://github.com/UriBailey/scripts/blob/main/uri-build.sh"
  version "0.1.0"
  sha256 :no_check

  depends_on "gh"

  def install
    bin.install "uri-build.sh" => "uri-build"
  end

  def caveats
    <<~EOS
      Prereqs:
        - GitHub CLI authenticated: gh auth login
        - Run inside a git repo with a PR for the branch you monitor

      Usage:
        uri-build -h
    EOS
  end

  test do
    output = shell_output("#{bin}/uri-build -h", 1)
    assert_match "Usage:", output
  end
end
