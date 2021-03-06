require 'formula'

class Vardict < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDict"
  version "2015-04-22"
  url "https://github.com/AstraZeneca-NGS/VarDict/archive/8f6dc6e.tar.gz"
  sha1 "a562961614e2825a701a0653e27016e0e26d7acf"

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_paired.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
