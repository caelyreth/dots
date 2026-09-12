{ inputs, machine, ... }:

let
  llm = inputs.llm-agents.packages.${machine.system};
in
{
  home.packages = [
    llm.fx
  ];
}
