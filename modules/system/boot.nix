{ config, pkgs, ... }:

{
  # Dual boot configuration with Windows
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      
      # Optional: Manual Windows entry (uncomment and adjust if os-prober doesn't work)
      # extraEntries = ''
      #   menuentry "Windows" {
      #     insmod part_gpt
      #     insmod fat
      #     insmod search_fs_uuid
      #     insmod chain
      #     search --fs-uuid --set=root YOUR_EFI_PARTITION_UUID
      #     chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      #   }
      # '';
    };
  };

  # Fix system time for dual boot with Windows
  time.hardwareClockInLocalTime = true;

  # Enable os-prober to detect Windows
  environment.systemPackages = with pkgs; [
    os-prober
  ];
}
