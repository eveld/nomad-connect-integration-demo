data_dir = "/etc/nomad.d"

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
  network_speed = 100
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}