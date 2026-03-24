terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }
}

provider "docker" {}

provider "aws" {
  access_key                  = var.aws_access_key_id
  region                      = var.aws_region
  s3_use_path_style           = true
  secret_key                  = var.aws_access_key_secret
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = var.aws_endpoint
    cloudformation = var.aws_endpoint
    cloudwatch     = var.aws_endpoint
    dynamodb       = var.aws_endpoint
    es             = var.aws_endpoint
    firehose       = var.aws_endpoint
    iam            = var.aws_endpoint
    kinesis        = var.aws_endpoint
    lambda         = var.aws_endpoint
    route53        = var.aws_endpoint
    redshift       = var.aws_endpoint
    s3             = var.aws_endpoint
    secretsmanager = var.aws_endpoint
    ses            = var.aws_endpoint
    sns            = var.aws_endpoint
    sqs            = var.aws_endpoint
    ssm            = var.aws_endpoint
    stepfunctions  = var.aws_endpoint
    sts            = var.aws_endpoint
  }
}


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