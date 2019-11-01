data_dir = "/etc/nomad.d"

server {
  enabled = true
  bootstrap_expect = 1
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}