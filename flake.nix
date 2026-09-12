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
      home-manager,
      sops-nix,
      ...
    }:
    let
      machine = {
        username = "caelyreth";
        hostname = "Unwritten";
        system = "aarch64-darwin";
      };
    in
    {
      darwinConfigurations.${machine.hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit machine; };

        modules = [
          # System-wide configuration.
          ./darwin.nix

          # Home Manager configuration.
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs machine;
              };
              users.${machine.username} = import ./home;
              sharedModules = [
                sops-nix.homeManagerModules.sops
              ];
            };
          }
        ];
      };
    };
}
