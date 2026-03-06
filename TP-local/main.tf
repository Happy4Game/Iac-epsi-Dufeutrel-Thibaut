terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.5.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "private_network" {
  name = "private_network"
}

resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id
  hostname = "nginx"
  ports {
    internal = var.internal_port
    external = var.external_port
  }
  networks_advanced {
    name = docker_network.private_network.id
  }
}

resource "docker_image" "curl" {
  name         = "appropriate/curl"
  keep_locally = true
}

resource "docker_container" "client" {
  for_each = toset(["server-1","server-2","server-x"])
  name  = "client-${each.key}"
  image = docker_image.curl.image_id
  depends_on = [docker_container.nginx]
  networks_advanced {
    name = docker_network.private_network.id
  }
  command= ["sh", "-c", "curl -fsSL http://nginx:${var.internal_port} && sleep 30"]
}