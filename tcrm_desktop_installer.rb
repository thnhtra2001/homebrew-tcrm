class TcrmDesktopInstaller < Formula
  desc "TCRM Flutter macOS app"
  homepage "https://github.com/thnhtra2001/tcrm_desktop/releases/download/v1.0.0/my_flutter_app.tar.gz"
  url "https://github.com/thnhtra2001/tcrm_desktop/releases/download/v1.0.0/my_flutter_app.tar.gz"
  sha256 "90008c192c89e7029bdd5eeb9a1420f8c1a182cfbc66b6f39d0f838ce916dbed"
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