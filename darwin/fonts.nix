{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    maple-mono.NF-CN
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
