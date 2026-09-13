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

  outputs =
    inputs@{
      nix-darwin,
      nixpkgs,
      home-manager,
      sops-nix,
      ...
    }:
    let
      machine = {
        username = "caelyreth";
        hostname = "Unwritten";
        system = "aarch64-darwin";
        configurationDirectory = "/etc/nix-darwin";
      };
      pkgs = nixpkgs.legacyPackages.${machine.system};
      palette = import ./home/palette.nix { inherit pkgs; };
    in
    {
      homeConfigurations.${machine.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs machine palette;
        };
        modules = [
          sops-nix.homeManagerModules.sops
          ./home
          {
            home = {
              username = machine.username;
              homeDirectory = "/Users/${machine.username}";
            };
          }
        ];
      };

      darwinConfigurations.${machine.hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit machine; };

        modules = [
          ./darwin
        ];
      };
    };
}
