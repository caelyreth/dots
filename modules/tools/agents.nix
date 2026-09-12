{ pkgs, shared, inputs, ... }:

let
  llm = inputs.llm-agents.packages.${shared.arch};
in
{
  home.packages = [
    llm.fx
  ];
}
