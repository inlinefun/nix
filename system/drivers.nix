{ pkgs, ... }:
{

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        # probably not needed
        # this is "unfree"
        # might as well avoid it
        # intel-ocl
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
