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

        service {
            name = "api"
            port = 9090

            tags = ["v1"]

            connect {
                sidecar_service {
                    proxy {
                        upstreams {
                            destination_name = "payments"
                            local_bind_port = 9091
                        }

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
                UPSTREAM_URIS = "http://localhost:9091"
                LISTEN_ADDR = "0.0.0.0:9090"
                NAME = "api (dc1)"
                MESSAGE = "api response"
                HTTP_CLIENT_KEEP_ALIVES = "false"
            }
        }
    }
}
