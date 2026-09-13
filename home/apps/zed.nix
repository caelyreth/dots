{ utils, ... }:

let
  file = "zed/settings.json";
in
{
  xdg.configFile.${file}.source = utils.mkDotfileSymlink file;
}
