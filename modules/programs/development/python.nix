{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Python interpreter and package management
    python3Full
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.wheel
    python3Packages.virtualenv
    pipenv                     # Environment manager (standalone package)
    
    # Popular Python packages that are commonly needed
    python3Packages.requests
    python3Packages.numpy
    python3Packages.pandas
    python3Packages.matplotlib
    python3Packages.pillow
    python3Packages.pyyaml
    python3Packages.click
    
    # Development tools
    python3Packages.black      # Code formatter
    python3Packages.flake8     # Linter
    python3Packages.pytest     # Testing framework
    python3Packages.ipython    # Enhanced interactive Python shell
    python3Packages.jupyter    # Jupyter notebooks
  ];

  # Enable Python development shell completions
  programs.bash.interactiveShellInit = ''
    # Python virtual environment support
    export PIP_REQUIRE_VIRTUALENV=false
  '';

  programs.zsh.interactiveShellInit = ''
    # Python virtual environment support  
    export PIP_REQUIRE_VIRTUALENV=false
  '';
}
