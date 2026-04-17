class MarkitdownGui < Formula
  include Language::Python::Virtualenv

  desc "Simple GUI for Microsoft MarkItDown"
  homepage "https://github.com/mattholihan/markitdown-gui"
  url "https://github.com/mattholihan/markitdown-gui/archive/refs/heads/main.tar.gz"
  version "0.1.0"

  depends_on "python@3.12"
  depends_on "ffmpeg"

  def install
    # 1. Create the private 'bubble'
    virtualenv_create(libexec, "python3.12")
    
    # 2. Install dependencies directly into the bubble
    system libexec/"bin/pip", "install", "customtkinter", "markitdown[all]"
    
    # 3. Link your GUI code into the bubble and create the /usr/local/bin shortcut
    virtualenv_install
  end

  test do
    # This checks if the command exists after installation
    system "#{bin}/markitdown-gui", "--version"
  end
end
