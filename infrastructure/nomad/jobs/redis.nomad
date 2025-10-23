job "redis" {
  datacenters = ["aws-lightsail"]
  type = "service"

  group "cache" {
    count = 1

    network {
      mode = "bridge"
      port "redis" {
        to = 6379
      }
    }

    volume "redis-data" {
      type      = "host"
      source    = "redis-data"
      read_only = false
    }

    service {
      name = "redis"  # ← Se registra como redis.service.consul
      port = "redis"
      tags = ["cache"]
      
      check {
        type     = "tcp"
        port     = "redis"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "redis-server" {
      driver = "docker"

      config {
        image = "redis:alpine"
        ports = ["redis"]
        command = "redis-server"
        args = [
          "--appendonly", 
          "yes",
          "--bind", "0.0.0.0"
        ]
      }

      volume_mount {
        volume      = "redis-data"
        destination = "/data"
        read_only   = false
      }

      env = {
        # Redis no necesita variables de entorno específicas
        # pero puedes agregar si necesitas configuración adicional
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}