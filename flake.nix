{
  description = "Yu's macOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
  };

  outputs = inputs@{
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    sops-nix,
    llm-agents,
    ...
  }:
  let
    shared = {
      user = "caelyreth";
      host = "Unwritten";
      arch = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations.${shared.host} = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit shared; };

      modules = [
        # system wide configuration
        ./darwin.nix

        # load home-manager
        home-manager.darwinModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
              inherit shared;
            };
            users.${shared.user} = import ./modules;
            sharedModules = [
              sops-nix.homeManagerModules.sops
            ];
          };
        }
      ];
    };
  };
}
