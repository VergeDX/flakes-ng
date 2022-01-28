{ pkgs, config, ... }:
{
  programs.chromium.enable = true;
  systemd.user.sessionVariables = {
    GOOGLE_DEFAULT_CLIENT_ID = "77185425430.apps.googleusercontent.com";
    GOOGLE_DEFAULT_CLIENT_SECRET = "OTJgUOQcT7lO7GsGZq2G4IlT";
  };

  home.file.".config/chromium".source =
    config.lib.file.mkOutOfStoreSymlink
      "/persistent/dot-config/chromium";
}
