datacenter = "aws-lightsail"
data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true
  servers = ["127.0.0.1:4647"]  # ⬅️ SOLO localhost

  # Configuración de red

  ## ⬇️ CONFIGURAR HOST NETWORKS
  host_network "public" {
    interface = "ens5"
    cidr = "172.26.6.0/24"
  }

  host_network "private" {
    interface = "ens5"
    cidr = "172.26.6.0/24"
  }
}

ports {
  http = 4646
  rpc  = 4647
  serf = 4648
}