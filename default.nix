with import <nixpkgs> { };

let jekyll_env = bundlerEnv rec {
    name = "jekyll_env";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
  stdenv.mkDerivation rec {
    name = "gem";
    buildInputs = [ jekyll_env bundler ruby zlib pkg-config ];

#     shellHook = ''
#       exec ${jekyll_env}/bin/jekyll serve --watch
#     '';
  }
