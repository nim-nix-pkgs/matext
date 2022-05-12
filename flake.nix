{
  description = ''Render LaTeX math as multiline Unicode text'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."matext-master".dir   = "master";
  inputs."matext-master".owner = "nim-nix-pkgs";
  inputs."matext-master".ref   = "master";
  inputs."matext-master".repo  = "matext";
  inputs."matext-master".type  = "github";
  inputs."matext-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."matext-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}