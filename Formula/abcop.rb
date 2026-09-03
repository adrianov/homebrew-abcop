class Abcop < Formula
  desc "Must-have ABC complexity gate for AI-written code"
  homepage "https://github.com/adrianov/abcop"
  url "https://github.com/adrianov/abcop/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "d952eed2f61d2d1beec2abe9dcb8c9c2ac60f4a17f26c6756851a0aae3d1ed9d"
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
