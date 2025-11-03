class TcrmDesktopInstaller < Formula
  desc "TCRM Flutter macOS app"
  homepage "https://github.com/thnhtra2001/tcrm_desktop/releases/download/v1.0.0/tcrm_desktop_installer.tar.gz"
  url "https://github.com/thnhtra2001/tcrm_desktop/releases/download/v1.0.0/tcrm_desktop_installer.tar.gz"
  sha256 "a15c4919785517baf0b7be907eaa5748b0d18e51832983bb30e5ef0e730bbbe2"
  version "1.0.0"

  def install
    prefix.install Dir["tcrm.app"]
    bin.install_symlink "#{prefix}/tcrm.app/Contents/MacOS/tcrm" => "tcrm_desktop"
  end

  def caveats
    <<~EOS
      ✅ Installed to:
        #{prefix}

      ▶ Run it with:
        open -a #{prefix}/tcrm.app
    EOS
  end
end