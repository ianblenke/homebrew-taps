require 'formula'

class Trousseau < Formula
  homepage 'https://github.com/oleiade/trousseau'
  url 'https://github.com/oleiade/trousseau/releases/download/0.3.4/trousseau_0.3.4_darwin_amd64.zip'
  sha1 ''

  def install
    bin.install('trousseau')
  end
end
