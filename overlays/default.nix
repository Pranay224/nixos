{ inputs, system, ... }:
[
  (import ./responder-overlay.nix)
  (import ./john-overlay.nix)
  (import ./burpsuite-overlay.nix { inherit inputs system; })
]
