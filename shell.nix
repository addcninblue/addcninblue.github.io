with import <nixpkgs> {};
let
  gems = bundlerEnv {
    name = "addcnin.blue";
    gemdir = ./.;
  };
in mkShell { buildInputs = [ gems gems.wrappedRuby ]; }
