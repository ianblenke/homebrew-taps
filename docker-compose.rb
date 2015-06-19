class DockerCompose < Formula
  homepage "http://docs.docker.com/compose/"
  url "https://github.com/docker/compose/archive/1.3.0.tar.gz"
  sha1 "f559e840a513a4a4c7f8aea7e3b8df193258c69a"

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "libyaml"

  # It's possible that the user wants to manually install Docker and Boot2Docker,
  # for example, they want to compile Docker manually
  depends_on "docker" => :recommended
  depends_on "boot2docker" => :optional
  depends_on "docker-machine" => :optional

  resource "docker-py" do
    url "https://pypi.python.org/packages/source/d/docker-py/docker-py-1.2.3.tar.gz"
    sha1 "47617271af939cec9d1424c8cd7c66d401c456df"
  end

  resource "pyyaml" do
    url "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
    sha1 "1a2d5df8b31124573efb9598ec6d54767f3c4cd4"
  end

  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz"
    sha1 "d168e6d01f0900875c6ecebc97da72d0fda31129"
  end

  resource "dockerpty" do
    url "https://pypi.python.org/packages/source/d/dockerpty/dockerpty-0.3.4.tar.gz"
    sha1 "50029f80aae4f21e0d7f1471e1fcb701e41f1fdb"
  end

  resource "texttable" do
    url "https://pypi.python.org/packages/source/t/texttable/texttable-0.8.1.tar.gz"
    sha1 "ca505fb7424defa99f5a85bdaf433a6b24ffa82c"
  end

  resource "docopt" do
    url "https://pypi.python.org/packages/source/d/docopt/docopt-0.6.2.tar.gz"
    sha1 "224a3ec08b56445a1bd1583aad06b00692671e04"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.6.1.tar.gz"
    sha1 "bf1283762677b2273d49e1ee7d649535a1205045"
  end

  resource "websocket-client" do
    url "https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.11.0.tar.gz"
    sha1 "a38cb6072a25b18faf11d31dd415750692c36f33"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    resources.each do |r|
      r.stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    ln_s bin/"docker-compose", bin/"fig"
  end

  test do
    system "#{bin}/docker-compose", "--version"
  end
end
