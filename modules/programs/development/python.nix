{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Python interpreter and package management
    python3Full
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.wheel
    python3Packages.virtualenv
    python3Packages.virtualenvwrapper
    pipenv                     # Environment manager (standalone package)
    poetry                     # Modern Python dependency management
    
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

  # Create a Python environment that allows pip installations
  environment.variables = {
    # Allow pip to install packages in user directory
    PIP_USER = "1";
    # Disable PEP 668 externally managed environment check
    PIP_BREAK_SYSTEM_PACKAGES = "1";
    # Add user pip packages to PATH
    PATH = "\${HOME}/.local/bin:\${PATH}";
  };

  # Enable Python development shell completions
  programs.bash.interactiveShellInit = ''
    # Python virtual environment support
    export PIP_REQUIRE_VIRTUALENV=false
    export PIP_USER=1
    export PIP_BREAK_SYSTEM_PACKAGES=1
    export PATH="$HOME/.local/bin:$PATH"
    
    # Virtualenvwrapper setup
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    if [ -f ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh ]; then
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
    fi
  '';

  programs.zsh.interactiveShellInit = ''
    # Python virtual environment support  
    export PIP_REQUIRE_VIRTUALENV=false
    export PIP_USER=1
    export PIP_BREAK_SYSTEM_PACKAGES=1
    export PATH="$HOME/.local/bin:$PATH"
    
    # Virtualenvwrapper setup
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    if [ -f ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh ]; then
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
    fi
  '';
}
