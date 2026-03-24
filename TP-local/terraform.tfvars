container_name  = "nginx-terraform"
image_name      = "nginx:latest"
internal_port   = 80
external_port   = 8080

aws_access_key_secret = "test" # Je sais que c'est interdit, mais c'est pour vous simplifier la vie

machines = [
  {
    name      = "web-server-1"
    vcpu      = 2
    disk_size = 20
    region    = "eu-west-1"
  },
  {
    name      = "web-server-2"
    vcpu      = 4
    disk_size = 50
    region    = "us-east-1"
  },
  {
    name      = "database-server"
    vcpu      = 8
    disk_size = 100
    region    = "ap-southeast-1"
  }
]
