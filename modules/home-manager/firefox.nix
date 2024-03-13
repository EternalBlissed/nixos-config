{ config, lib, pkgs, self, ... }:
let
  inherit (self.lib)
    buildFirefoxXpiAddon
    ;

  inherit (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.base.firefox;
in
{
  options.base.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles.default = {
        extensions =
          with pkgs.nur.repos.rycee.firefox-addons;
          with customAddons;
          [
            darkreader
            return-youtube-dislikes
            sponsorblock
            tree-style-tab
            ublock-origin
            web-scrobbler
          ];

        settings = {
          # Don't save passwords.
          "signon.rememberSignons" = false;

          # Don't show a warning when opening about:config. I know what I'm doing!
          "browser.aboutConfig.showWarning" = false;

          # Disable telemetry.
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.tabs.crashReporting.sendReport" = false;
          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.unified" = false;

          # Disable Firefox Pocket.
          "extensions.pocket.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;

          # Disable Firefox View.
          "browser.tabs.firefox-view" = false;

          # Disable Firefox account features
          "identity.fxaccounts.enabled" = false;

          # Enable dark theme.
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "browser.theme.content-theme" = 2;
          "browser.theme.toolbar-theme" = 2;
        };
      };
    };
  };
}

