final: prev: {
  macmon = prev.macmon.overrideAttrs (finalAttrs: prevAttrs: {
    version = "0.8.2";

    src = final.fetchFromGitHub {
      owner = "vladkens";
      repo = "macmon";
      tag = "v0.8.2";

      hash = "sha256-tdWuxpV+AAN189etks6LVo4OYDYQNd9dzfopECFgoR8=";
    };

    cargoHash = "sha256-U71Qrplz2CY5CiYpDjFrtWQOy1J4HE3tMhnRbLXUD7k=";

    cargoDeps = final.rustPlatform.fetchCargoVendor {
      inherit (finalAttrs) pname version src;
      hash = finalAttrs.cargoHash;
    };
  });
}
