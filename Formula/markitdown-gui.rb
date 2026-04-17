class MarkitdownGui < Formula
  include Language::Python::Virtualenv

  desc "Simple GUI for Microsoft MarkItDown"
  homepage "https://github.com/mattholihan/markitdown-gui"
  url "https://github.com/mattholihan/markitdown-gui/archive/refs/heads/main.tar.gz"
  version "0.1.0"

  depends_on "python@3.12"
  depends_on "ffmpeg"

  def install
    virtualenv_install_with_resources
  end

  test do
    # This checks if the command exists after installation
    system "#{bin}/markitdown-gui", "--version"
  end
end
