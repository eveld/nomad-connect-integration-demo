data_dir = "/tmp/consul"
log_level = "DEBUG"

datacenter = "dc1"
primary_datacenter = "dc1"

server = true
ui = true

bootstrap_expect = 1

bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "10.5.0.2"
advertise_addr_wan = "192.169.7.2"

ports {
  grpc = 8502
}

connect {
  enabled = true
}

enable_central_service_config = true

config_entries {
  bootstrap = [
    {
      kind = "proxy-defaults"
      name = "global"
      
      config {
        protocol = "http"
      }
      
      mesh_gateway = {
        mode = "local"
      }
    }
  ]
}
