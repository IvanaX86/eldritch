{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (weechat.override {
      configure = { availablePlugins, ... }: {
        scripts = with weechatScripts; [
          autosort
          weechat-autosort
          buffer_autoset
          colorize_nicks
          highmon
          multiline
          url_hint
          weechat-grep
          weechat-go
          zncplayback
        ];
      };
    })
  ];
}
