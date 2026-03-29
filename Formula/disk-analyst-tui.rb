class DiskAnalystTui < Formula
  include Language::Python::Virtualenv

  desc "TUI system manager for macOS — disk analysis, smart cleanup, and package management"
  homepage "https://github.com/niuton/disk-analyst-tui"
  url "https://github.com/niuton/disk-analyst-tui/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Disk Analyst", shell_output("#{bin}/disk-analyst --help")
  end
end
