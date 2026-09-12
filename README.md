### Yu's dots

Bootstraping...

```sh
username=caelyreth
sudo mkdir -p /etc/nix-darwin && sudo chown "$username" /etc/nix-darwin
git clone https://github.com/caelyreth/dots.git /etc/nix-darwin
cd /etc/nix-darwin
sudo nix run --inputs-from . nix-darwin#darwin-rebuild -- switch --flake .#Unwritten
nix build ".#homeConfigurations.$username.activationPackage" --out-link /tmp/home-manager
/tmp/home-manager/activate && rm /tmp/home-manager
```
