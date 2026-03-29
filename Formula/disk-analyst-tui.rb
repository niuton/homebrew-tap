class DiskAnalystTui < Formula
  desc "TUI system manager for macOS — disk analysis, smart cleanup, and package management"
  homepage "https://github.com/niuton/disk-analyst-tui"
  url "https://github.com/niuton/disk-analyst-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "507e4735c2a1ddca99f37e38394ee9f8eeed1ecc9a33f125f1c259dd53d627b5"
  license "MIT"

  depends_on "python@3.13"

  def install
    python3 = "python3.13"
    venv = libexec/"venv"

    system python3, "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "."

    (bin/"disk-analyst").write_env_script(venv/"bin/disk-analyst", PATH: "#{venv}/bin:$PATH")
  end

  test do
    assert_match "usage", shell_output("#{bin}/disk-analyst --help")
  end
end
