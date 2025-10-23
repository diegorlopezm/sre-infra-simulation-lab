job "traefik" {
  datacenters = ["aws-lightsail"]
  type = "system"  # System job = se ejecuta en todos los nodos

  group "traefik" {
    network {
      mode = "host"
      port "http" {
        static = 80
        to     = 80
      }
      port "api" {
        static = 8080
        to     = 8080
      }
    }

    task "traefik" {
      driver = "docker"

      config {
        image = "traefik:v2.10"
        args = [
          "--api.dashboard=true",
          "--api.insecure=true",
          "--providers.nomad=true",
          "--providers.nomad.endpoint.address=http://127.0.0.1:4646",
          "--providers.nomad.exposedbydefault=false",
          "--entrypoints.web.address=:80",
          "--log.level=DEBUG"
        ]
        ports = ["http", "api"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}