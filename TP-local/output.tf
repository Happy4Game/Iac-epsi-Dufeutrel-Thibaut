output nginx_container_id {
  value       = docker_container.nginx.id
  description = "Id of container"
}
