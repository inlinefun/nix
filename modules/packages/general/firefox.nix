{
  config,
  lib,
  ...
}:

let
  cfg = config.packages.firefox;
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{

  options.packages.firefox = {
    enable = lib.mkEnableOption "Whether to enable Mozilla Firefox for usage" // {
      default = true;
    };
    defaultLanguagePack = lib.mkOption {
      type = lib.types.str;
      default = "en-US";
      description = "Default language pack to configure firefox with";
    };
    languagePacks = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Language packs to configure firefox along with";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      languagePacks = [ cfg.defaultLanguagePack ] ++ cfg.languagePacks;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always";
        ExtensionSettings = {
          # AdGuard AdBlocker:
          "adguardadblocker@adguard.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "navbar";
          };
          # ClearURLs:
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "menupanel";
          };
          # Firefox Multi-Account Containers
          "@testpilot-containers" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            # why is there a random 17
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "menupanel";
          };
        };
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
    };
  };

}
