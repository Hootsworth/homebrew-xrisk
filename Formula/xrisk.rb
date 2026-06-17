class Xrisk < Formula
  desc "Autonomous safety and control layer for LLM and agentic workflows"
  homepage "https://github.com/hootsworth/xrisk"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/hootsworth/xrisk/releases/download/v#{version}/xrisk-macos-x64"
      sha256 "8dfd4f07041e1dab659e83fd54161025e96dafd731dac49a38ad010639df9f87"
    elsif Hardware::CPU.arm?
      url "https://github.com/hootsworth/xrisk/releases/download/v#{version}/xrisk-macos-arm64"
      sha256 "ff6a8228bbe4bd47c7173f37847575e884e3b1dfd057e5b89e9cc3fa4c8ab8ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hootsworth/xrisk/releases/download/v#{version}/xrisk-linux-x64"
      sha256 "8d9a167d41811fed35f83a90080a0e928ac9cd98704ebdbe757a2d5880261b98"
    elsif Hardware::CPU.arm?
      url "https://github.com/hootsworth/xrisk/releases/download/v#{version}/xrisk-linux-arm64"
      sha256 "cbf5d9d7e1f653cb08f8186deeb7fd9f157fb0c12a323b583db096be6314d65c"
    end
  end

  def install
    # Identify downloaded file and rename to 'xrisk' in Homebrew's bin folder
    binary_name = Dir["xrisk-*"].first || "xrisk-macos-arm64" # fallback name checking
    
    if File.exist?(binary_name)
      bin.install binary_name => "xrisk"
    else
      # If curl downloaded it directly as the target file
      bin.install "xrisk"
    end
  end

  test do
    # Simple check that the binary runs and exits clean
    assert_match "Usage:", shell_output("#{bin}/xrisk --help")
  end
end
