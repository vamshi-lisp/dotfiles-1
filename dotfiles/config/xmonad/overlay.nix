_: pkgs: rec {
  haskellPackages = pkgs.haskellPackages.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: rec {
      xmonad = self.callCabal2nix "xmonad" (fetchGit ./xmonad) { };
      xmonad-contrib = self.callCabal2nix "xmonad-contrib" (fetchGit ./xmonad-contrib) { };
      imalison-xmonad = self.callCabal2nix "imalison-xmonad" (
        pkgs.lib.sourceByRegex ./.
        [
          "xmonad.hs" "imalison-xmonad.cabal"
          "PagerHints.hs" "LICENSE"
        ]
      ) { };
    });
  });
}
