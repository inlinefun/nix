{ pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      mesa

      intel-vaapi-driver
      vaapi-intel-hybrid

      vulkan-extension-layer
      vulkan-headers
      vulkan-tools
      vulkan-validation-layers
    ];
  };

}
