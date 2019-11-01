job "payments" {
    datacenters = ["dc1"]

    type = "service"

    group "payments" {
        count = 1

        update {
            max_parallel = 1
            canary = 1
            min_healthy_time = "30s"
            healthy_deadline = "5m"
            auto_revert = true
            auto_promote = false
        }

        network {
            mode = "bridge"
        }

        service {
            name = "payments"
            port = 9090

            tags = ["v1"]
            address_mode = "driver"

            meta {
                version = 1
            }

            connect {
                sidecar_service {
                    proxy {
                        config {
                            protocol = "http"
                        }
                    }
                }
            }
        }

        task "fake-service" {
            driver = "docker"

            config {
                image = "nicholasjackson/fake-service:v0.7.8"
            }

            env {
                LISTEN_ADDR = "0.0.0.0:9090"
                NAME = "payments v1 (dc1)"
                MESSAGE = "payments response"
                HTTP_CLIENT_KEEP_ALIVES = "false"
            }
        }
    }
}
