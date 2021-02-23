{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { python = python; }).customize{
      name = "vim";
      #vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
      #  start = [ vim-nix vim-lastplace ];
      #  opt = [];
      #};
      # Idk if this works
      vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
      vimrcConfig.vam.pluginDictionaries = [
        { names = [
            "vim-nix"
            "vim-lastplace"
        ]; }
      ];
      vimrcConfig.customRC = ''
        set nocompatible
        set backspace=indent,eol,start
        let mapleader = ","
        nmap <leader>w :w!<cr>
        nmap <leader>q :wq!<cr>
        nmap <leader>Q :q!<cr>
        set number
        set relativenumber
        set tabstop=2
      '';
      
    }
  )];
}
