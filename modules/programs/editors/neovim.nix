{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = false;
    viAlias = false;
    vimAlias = false;
    configure = {
      customRC = ''
        set number
        set relativenumber
        set tabstop=2
        set shiftwidth=2
        set expandtab
        set autoindent
        set smartindent
        set wrap
        set ignorecase
        set smartcase
        set incsearch
        set hlsearch
        syntax on
        colorscheme desert
        filetype plugin indent on
      '';
      
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          gruvbox-community
          nord-vim
          onedark-vim
          vim-nix
          vim-yaml
          vim-toml
          vim-json
          vim-javascript
          typescript-vim
          rust-vim
          vim-go
          python-syntax
          vim-markdown
          vim-airline
          vim-airline-themes
          nerdtree
          vim-gitgutter
          vim-fugitive
          ctrlp-vim
          vim-commentary
          vim-surround
          vim-multiple-cursors
          vim-polyglot
        ];
      };
    };
  };
}
