class Oil < Formula
  desc "Bash-compatible Unix shell with more consistent syntax and semantics"
  homepage "https://www.oilshell.org/"
  url "https://www.oilshell.org/download/oil-0.8.1.tar.gz"
  sha256 "d2ebfe83b5ea1c3fbc77cb90241cab6115d2152f61b53db3c8f39bbff73be1da"
  license "Apache-2.0"
  head "https://github.com/oilshell/oil.git"

  bottle do
    sha256 "abcca1e8d09418c37353e4e3dd4d402ef0b88ae5a62145505a8f0a1013ebab98" => :catalina
    sha256 "1092e415a1068d6ec386bb35d2db622f99b9ad494170dc8a481b21fc994dd6da" => :mojave
    sha256 "5d4a42d6a676077d188149e33b9faf4c31dfd36f06cbe3496839b9b6e5928344" => :high_sierra
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "./install"
  end

  test do
    assert_equal pipe_output("#{bin}/osh -c 'pwd'").strip, testpath.to_s
  end
end
