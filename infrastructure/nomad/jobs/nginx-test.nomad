job "nginx-test" {
  type = "service"
  datacenters = ["aws-lightsail"]

  group "web" {
    count = 1

    network {
      port "http" {
        static = 8080
        to     = 80 
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:alpine"
        ports = ["http"]
       
      }

      resources {
        cpu    = 50
        memory = 64
      }
    }
  }
}