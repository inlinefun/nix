{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        mesa
        vaapi-intel-hybrid
        vulkan-extension-layer
        vulkan-headers
        vulkan-tools
        vulkan-validation-layers
      ];
    };
  };
}
