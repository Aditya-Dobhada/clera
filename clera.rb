class Clera < Formula
  desc "Blows up your terminal if you mistype clear"
  homepage "https://github.com/kz6fittycent/clera"
  url "https://github.com/kz6fittycent/clera/archive/refs/tags/v0.3.tar.gz"
  sha256 "400e142960fcf9d229df54466529599c6ce4c800184cbc3d6ba4c8fefd673ab1"
  license "MIT"

  depends_on "gcc" # C compiler
  depends_on "python@3.9" => :build # for Cython
  depends_on "lp_solve" => :build

  def install
    bin.install "clera"
    system "pip3 install cython" # install Cython
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install" # build and install
    bin.install "clera.py"
  end

  test do
    system "#{bin}/clera", "--version" # test if the version command runs successfully
  end
end
