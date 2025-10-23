job "blog-db" {
  datacenters = ["aws-lightsail"]
  type = "service"

  group "database" {
    count = 1

    network {
      mode = "bridge"
      port "db" {
        to = 5432
      }
    }

    volume "blog-data" {
      type      = "host"
      source    = "blog-data"
      read_only = false
    }
    volume "init-scripts" {
      type      = "host"
      source    = "/home/ec2-user/sre-infra-simulation-lab/infrastructure/web-apps/init-scripts"        # Folder with SQL scripts
      read_only = true
    }
    service {
      name = "blog-db"
      port = "db"
      tags = ["postgres"]
      
      check {
        type     = "tcp"
        port     = "db"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:15"
        ports = ["db"]
      }

      env = {
        POSTGRES_DB       = "blog_db"
        POSTGRES_USER     = "blog_user"
        POSTGRES_PASSWORD = "blog_pass"
      }

      volume_mount {
        volume      = "blog-data"
        destination = "/var/lib/postgresql/data"
        read_only   = false
      }
      volume_mount {
        volume      = "init-scripts"
        destination = "/docker-entrypoint-initdb.d" 
    }
      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}