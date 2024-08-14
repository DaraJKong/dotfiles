{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    cudatoolkit
    (inputs.blender-bin.packages.${pkgs.system}.blender_4_2)
  ];
}
