class UriBuild < Formula
  desc "PR rebuild monitor that comments #rebuild when Falcon CI requests it"
  homepage "https://github.com/UriBailey/scripts"

  # Use the raw file URL; the GitHub `/blob/` URL serves HTML.
  url "https://raw.githubusercontent.com/UriBailey/scripts/main/uri-build.sh"
  version "0.1.0"
  sha256 "e7adeb5a6a78495394807ff216aa9a32a7d2a5a8efea292e37b32c2fd09538a9"

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
