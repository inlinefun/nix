{
  pkgs,
  ...
}:

{

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapi-intel-hybrid
      vpl-gpu-rt
      vulkan-headers
      vulkan-loader
      vulkan-validation-layers
    ];
  };
}
