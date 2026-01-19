class UriBuild < Formula
  desc "PR rebuild monitor that comments #rebuild when Falcon CI requests it"
  homepage "https://github.com/UriBailey/scripts"

  # Use the raw file URL; the GitHub `/blob/` URL serves HTML.
  url "https://raw.githubusercontent.com/UriBailey/scripts/main/uri-build.sh"
  version "0.1.1"
  sha256 "61eed2af542f99eca5898ad911db58f6b99ff2db6cafcb7f737f7df67a6c4bbc"

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
