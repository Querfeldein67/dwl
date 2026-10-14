{
  description = "Dwl dev flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: let
    pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
  in {
    devShells."x86_64-linux".default = pkgs.mkShell {
      buildInputs = with pkgs; [
        libinput wayland wlroots libxkbcommon wayland-protocols pkg-config gnumake
      ];
    };
  };
}
