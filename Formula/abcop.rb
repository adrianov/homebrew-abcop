class Abcop < Formula
  desc "Must-have ABC complexity gate for AI-written code"
  homepage "https://github.com/adrianov/abcop"
  url "https://github.com/adrianov/abcop/archive/refs/tags/v0.18.3.tar.gz"
  sha256 "da8a1bd64ef06f61d3ddb302f93aa9e25b36c0f937f05a98d12b24337e4ef955"
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
