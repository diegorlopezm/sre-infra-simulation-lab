job "blog-app" {
  datacenters = ["aws-lightsail"]
  type = "service"

  group "blog" {
    count = 3

    network {
      mode = "bridge"
      port "http" {
        to = 5000
      }
    }

    service {
      name = "blog-app"
      port = "http"
      
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.blog.rule=Host(`blog.diegoricardo.dev`)",
        "traefik.http.routers.blog.entrypoints=web",
        "traefik.http.services.blog.loadbalancer.server.port=5000"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "blog-server" {
      driver = "docker"

      config {
        image = "diegorlopez/web-apps-blog-app-1:v1.0"
        ports = ["http"]
      }

      env = {
        # ✅ Service discovery automático con Consul
        DATABASE_URL = "postgresql://blog_user:blog_pass@blog-db.service.consul:5432/blog_db"
        REDIS_URL    = "redis://redis.service.consul:6379"  # ← Conecta a Redis
        INSTANCE_NAME = "INSTANCE-${NOMAD_ALLOC_INDEX}"
        INSTANCE_COLOR = "${NOMAD_ALLOC_INDEX == 0 ? "lightblue" : NOMAD_ALLOC_INDEX == 1 ? "lightgreen" : "lightcoral"}"
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}