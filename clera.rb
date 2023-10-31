class Clera < Formula
  desc "Blows up your terminal if you mistype clear"
  homepage "https://github.com/kz6fittycent/clera"
  url "https://github.com/kz6fittycent/clera/archive/refs/tags/v0.3.tar.gz"
  sha256 "400e142960fcf9d229df54466529599c6ce4c800184cbc3d6ba4c8fefd673ab1"
  license "MIT"

  depends_on "gcc" # C compiler
  depends_on "python@3.9" # for Cython and running the script
  depends_on "lp_solve" => :build

  def install
    system "pip3 install cython" # install Cython
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install" # build and install

    # Install 'clera' as a script instead of a binary
    bin.install "#{buildpath}/clera.py"
  end

  test do
    system "#{bin}/clera.py", "--version" # test if the version command runs successfully
  end
end
