# nvidia-smi --query-gpu utilization.gpu,memory.used,temperature.gpu --format csv | lines | get 1 | str replace -a " " "" | split row "," | to json 

let gpu = nvidia-smi --query-gpu=utilization.gpu --format=csv | lines | get 1 | str replace " %" ""
let mem = (nvidia-smi --query-gpu=memory.used --format=csv | lines | get 1 | str replace " MiB" "" | into float) * 1000000 / 1024 / 1024 / 1024
let temp = nvidia-smi --query-gpu=temperature.gpu --format=csv | lines | get 1 | str replace " C" ""
{gpu: $gpu, mem: $mem, temp: $temp} | to json -r
