# Định nghĩa 1 class mới cho Homebrew formula, tên phải trùng với tên file (viết hoa chữ cái đầu)
# Ví dụ file là my_flutter_app.rb → class là MyFlutterApp
class MyFlutterApp < Formula

  # Mô tả ngắn gọn về app (hiện khi người dùng gõ brew info)
  desc "TCRM Flutter macOS app"

  # Trang chủ hoặc link GitHub của app (dùng để tham khảo hoặc kiểm tra update)
#   homepage "https://github.com/teatran/my_flutter_app"

  # Đường dẫn trực tiếp đến file .tar.gz mà Homebrew sẽ tải về khi cài đặt
  # File này chính là app Flutter bạn đã build & nén, upload trên GitHub Release
  url "https://github.com/thnhtra2001/tcrm_desktop.git"

  # Mã SHA256 của file trên để đảm bảo tính toàn vẹn (Homebrew sẽ kiểm tra trước khi giải nén)
  sha256 "90008c192c89e7029bdd5eeb9a1420f8c1a182cfbc66b6f39d0f838ce916dbed"

  # Phiên bản của app
  version "1.0.0"

  # ------------------------------------------------------------
  # Phần dưới đây mô tả cách Homebrew cài đặt app sau khi tải về
  # ------------------------------------------------------------
  def install
    # Cài (copy) toàn bộ thư mục MyApp.app vào thư mục "prefix" (Homebrew Cellar)
    # Dir["MyApp.app"] chọn toàn bộ thư mục app nằm trong archive.
    prefix.install Dir["tcrm.app"]

    # Tạo một symbolic link (đường dẫn rút gọn) để có thể gọi app bằng lệnh terminal
    # Ví dụ: gõ "my_flutter_app" trong terminal sẽ chạy file binary trong app bundle
    bin.install_symlink "#{prefix}/MyApp.app/Contents/MacOS/MyApp" => "tcrm_desktop"
  end

  # ------------------------------------------------------------
  # Phần này hiển thị hướng dẫn cho người dùng sau khi cài xong
  # ------------------------------------------------------------
  def caveats
    <<~EOS
      TCRMApp.app was installed to:
        #{prefix}

      You can run it with:
        open -a #{prefix}/tcrm.app
    EOS
  end
end