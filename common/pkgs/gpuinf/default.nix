pkgs:

pkgs.writeScriptBin "gpuinf" ''
  #! ${pkgs.nushell}/bin/nu

  def main [ -j ] {
      let gpu = nvidia-smi --query-gpu utilization.gpu --format csv | lines | get 1 | str replace " %" ""
      let mem = (nvidia-smi --query-gpu memory.used --format csv | lines | get 1 | str replace " MiB" "" | into float) * 1000000 / 1024 / 1024 / 1024
      let deg = nvidia-smi --query-gpu temperature.gpu --format csv | lines | get 1 | str replace " C" ""
      let res = {gpu: $gpu, mem: $mem, deg: $deg}
      if $j {
          $res | to json -r
      } else {
        $res
      }
  }
''
