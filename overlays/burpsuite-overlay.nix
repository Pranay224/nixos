{ inputs, system, ... }:
final: prev: {
  burpsuite = inputs.burpsuite-patched.packages.${system}.default;
}
