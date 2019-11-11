job "cleanup" {
    datacenters = ["dc1"]

    type = "system"

    group "cleanup" {
        count = 1

        network {
            mode  = "bridge"
        }

        service {
            name = "cleanup"
            port = 9090

            connect {
                sidecar_service {}
            }
        }

        task "fake-service" {
            driver = "docker"

            config {
                image = "nicholasjackson/fake-service:v0.7.8"
            }

            env {
                LISTEN_ADDR = "0.0.0.0:9090"
                NAME = "cleanup"
                MESSAGE = "cleanup"
                HTTP_CLIENT_KEEP_ALIVES = "false"
            }
        }
    }
}
