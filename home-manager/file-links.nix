{ config, ... }:
{
  home.file.".config/monitors.xml".source =
    config.lib.file.mkOutOfStoreSymlink
      "/persistent/dot-config/monitors.xml";
}
