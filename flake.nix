{
  description = "RiscV game compilation";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2305.491812.tar.gz";
  };

  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }: {
        default =
          let
            # binName = "zero-to-nix-cpp";
            rvccDependencies = with pkgs; [ gcc ];
            rv8Dependencies = with pkgs; [ gnat ]
          in
          pkgs.stdenv.mkDerivation {
            name = "zero-to-nix-cpp";
            src = self;
            buildInputs = [ rv8Dependencies rvccDependencies ];
            buildPhase = ''


            '';
            installPhase = ''
            
            

            '';
          };
      });
    };
}
