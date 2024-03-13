{ pkgs, ... }:

{
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    ms-azuretools.vscode-docker
    github.copilot
    unifiedjs.vscode-mdx
    serayuzgur.crates
    bungcip.better-toml
    svelte.svelte-vscode
    ms-python.python
    rust-lang.rust-analyzer
    emmanuelbeziat.vscode-great-icons
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    oderwat.indent-rainbow
  ];
 };
}
