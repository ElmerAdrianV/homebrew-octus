class Octus < Formula
  desc "Octus - Onboarding Buddy B2B CLI"
  homepage "https://github.com/ElmerAdrianV/octus-autoinstaller-cli"
  version "0.1.1"

  on_macos do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.1/octus-macos"
    sha256 "6b0843e174133847a8d078a214e892b78227599987224736c79a978e0bc96675"
  end

  on_linux do
    url "https://github.com/ElmerAdrianV/homebrew-octus/releases/download/v0.1.1/octus-linux"
    sha256 "009c47828892ba5f9e5f9438a23def32bfd6ca15325c50b8e93d97e6460f6356"
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
