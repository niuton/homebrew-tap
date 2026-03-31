class DiskAnalystTui < Formula
  desc "TUI system manager for macOS — disk analysis, smart cleanup, and package management"
  homepage "https://github.com/niuton/disk-analyst-tui"
  url "https://github.com/niuton/disk-analyst-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "27108222eb5f2532c22a0683cc822c95353116ec31ac45b76fd92383b21b204c"
  license "MIT"

  depends_on "python@3.13"

  def install
    python3 = Formula["python@3.13"].opt_bin/"python3.13"

    # Create virtualenv with pip
    system python3, "-m", "venv", libexec
    venv_pip = libexec/"bin/pip"

    # Install build deps and package
    system venv_pip, "install", "hatchling"
    system venv_pip, "install", "."

    # Create wrapper script
    (bin/"disk-analyst").write <<~BASH
      #!/bin/bash
      exec "#{libexec}/bin/disk-analyst" "$@"
    BASH
    chmod 0755, bin/"disk-analyst"
  end

  test do
    assert_match "macOS system manager", shell_output("#{bin}/disk-analyst --help")
  end
end
