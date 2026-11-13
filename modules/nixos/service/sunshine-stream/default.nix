{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.system.sunshineStream;
in
{
  options.my.system.sunshineStream = {
    enable = mkEnableOption "Sunshine streaming script with audio routing";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "sunshine-stream" ''
        #!/usr/bin/env bash
        set -euo pipefail

        SINK_NAME="game_audio"
        SINK_DESC="Game_Audio"

        sudo systemctl start tailscaled || true

        MODULE_ID=$(${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name="$SINK_NAME" sink_properties=device.description="$SINK_DESC")

        sunshine > /dev/null 2>&1 &
        SUNSHINE_PID=$!

        cleanup() {
            sudo systemctl stop tailscaled || true
            ${pkgs.pulseaudio}/bin/pactl unload-module "$MODULE_ID" || true
        }
        trap cleanup EXIT

        wait $SUNSHINE_PID
      '')

      (pkgs.symlinkJoin {
        name = "sunshine-stream-desktop";
        paths = [
          (pkgs.writeTextDir "share/applications/sunshine-stream.desktop" ''
            [Desktop Entry]
            Name=Sunshine Stream
            Comment=Start Sunshine and create Game_Audio sink
            Exec=${pkgs.writeShellScriptBin "sunshine-stream-launch" ''
              sunshine-stream > /dev/null 2>&1 &
            ''}/bin/sunshine-stream-launch
            Icon=dev.lizardbyte.app.Sunshine
            Terminal=false
            Type=Application
            Categories=AudioVideo;Network;
          '')
        ];
      })
    ];
  };
}
