class Octus < Formula
  desc "Octus - Onboarding Buddy CLI"
  homepage "https://github.com/ElmerAdrianV/octus-autoinstaller-cli"
  version "0.1.2"

  on_macos do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.2/octus-macos"
    sha256 "674bd328e2bb6711ce187cf64fe7feefe34c8a0b42d22db02e2143f27a6bda4f"
  end

  on_linux do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.2/octus-linux"
    sha256 "60e117814c9c95140ea630ef560b8dedf28201bf0afce6a2aed777da8503452b"
  end

  def install
    if OS.mac?
      bin.install "octus-macos" => "octus"
    else
      bin.install "octus-linux" => "octus"
    end
  end

  test do
    system "#{bin}/octus", "--version"
  end
end
