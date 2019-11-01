data_dir = "/tmp/consul"
log_level = "DEBUG"
retry_join = ["10.5.0.2"]

enable_central_service_config = true

ports {
    grpc = 8502
}