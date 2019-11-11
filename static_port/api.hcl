job "api" {
    datacenters = ["dc1"]

    type = "service"

    group "api" {
        count = 1

        network {
            mode  = "bridge"
            port "http" {
                static = "9090"
                to = "9090"
            }
        }

        task "fake-service" {
            driver = "docker"

            config {
                image = "nicholasjackson/fake-service:v0.7.8"
            }

            env {
                LISTEN_ADDR = "0.0.0.0:9090"
                NAME = "api (dc1)"
                MESSAGE = "api response"
                HTTP_CLIENT_KEEP_ALIVES = "false"
            }
        }
    }
}
