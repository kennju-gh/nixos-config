# Mapping (change kennsa to kennju)
host_detected := if env_var("USER") == "kennsa" { "desktop" } else { "laptop" }

# Default: list recipes
default:
    @just --list

# Build for next boot
boot host=host_detected:
    nh os boot .#{{host}}

# Activate the configuration
switch host=host_detected:
    nh os switch .#{{host}}

# Update flake inputs and build for next boot
update host=host_detected:
    nix flake update
    git add flake.lock
    git commit -m "chore: flake update $(date +%Y-%m-%d)"
    just boot {{host}}
    git push

# Run garbage collection manually
gc:
    nh clean all --keep 3

# Check flake eval
check:
    nix flake check
