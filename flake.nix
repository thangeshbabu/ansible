{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
         # <add the required packages here>
         # search packages in https://search.nixos.org
         # vagrant
         # kubernetes-helm
         vagrant
         qemu
         kubectl
        ];
        shellHook = ''
            # export KUBECONFIG='/home/thbabua/personal/repository/kubeadm/libvirt/admin.conf'
        '';
      };
    };
}
