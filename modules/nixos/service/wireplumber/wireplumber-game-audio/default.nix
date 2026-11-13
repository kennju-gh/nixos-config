{ config, lib, ... }:
with lib;
let
  cfg = config.my.system.wireplumber.gameAudio;
in
{
  options.my.system.wireplumber.gameAudio = {
    enable = mkEnableOption "route game audio to Game_Audio sink";
  };

  config = mkIf cfg.enable {
    services.pipewire.wireplumber.extraConfig."51-game-audio" = {
      "node.rules" = [
        {
          matches = [
            { "application.process.binary" = "wine64-preloader"; }
          ];
          actions = {
            "update-props" = {
              "target.object" = "game_audio";
            };
          };
        }
      ];
    };
  };
}
