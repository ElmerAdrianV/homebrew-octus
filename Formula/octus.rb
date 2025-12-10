class Octus < Formula
  desc "Octus - Onboarding Buddy B2B CLI"
  homepage "https://github.com/ElmerAdrianV/octus-autoinstaller-cli"
  version "0.1.0"

  on_macos do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.0/octus-macos"
    sha256 "REEMPLAZAR_CON_SHA256_DEL_ARCHIVO_MACOS"
  end

  on_linux do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.0/octus-linux"
    sha256 "REEMPLAZAR_CON_SHA256_DEL_ARCHIVO_LINUX"
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
