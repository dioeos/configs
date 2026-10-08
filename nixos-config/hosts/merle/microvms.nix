{ inputs, ... }:

{
  microvm.vms = {
    server-vm = {
      flake = inputs.redjaxk;
      autostart = false;
    };
    agent-vm = {
      flake = inputs.redjaxk;
      autostart = false;
    };
  };

  systemd.network = {
    enable = true;

    netdevs."20-redjaxk" = {
      netdevConfig = {
        Kind = "bridge";
        Name = "br-redjaxk";
      };
    };

    networks = {
      "30-redjaxk-bridge" = {
        matchConfig.Name = "br-redjaxk";
        address = [ "192.168.100.1/24" ];
        networkConfig.ConfigureWithoutCarrier = true;
      };

      "30-redjaxk-taps" = {
        matchConfig.Name = "rj-server-vm rj-agent-vm";
        networkConfig.Bridge = "br-redjaxk";
      };
    };
  };

}
