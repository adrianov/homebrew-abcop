class Abcop < Formula
  desc "Must-have ABC complexity gate for AI-written code"
  homepage "https://github.com/adrianov/abcop"
  url "https://github.com/adrianov/abcop/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "7ecaf944672d7eeef7e584deb5a8027433b7a2f0c4cba46b146f23836e1c515a"
  license "GPL-3.0-or-later"
  head "https://github.com/adrianov/abcop.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/abcop.1"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/abcop --help")
    assert_path_exists man1/"abcop.1"
  end
end
