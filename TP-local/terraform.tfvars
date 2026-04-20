container_name  = "nginx-terraform"
image_name      = "nginx:latest"
internal_port   = 80
external_port   = 8080

aws_secret_key = "X49rEBeUa0opGe3kLZ7XiizX+rYqyL8tMNzV8pbTIQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIHRJwg7L0Fki4Tk/z2PxVopIqWS67b7hZ2ijFnp0VlFWAiBRkcJeK6C2XCD6EL0NXs1G7t54JSgQo2VP6Vt4KLLWCCqsAgjb//////////8BEAAaDDg5MTM3NzEwMTI3OSIM9N7Fn6S4YO/MiVF0KoAClTxytGMC+H/Su7dbxsdh1/GE4HmhX6TxylwElBVbWE2fvq20o4OvyMp9m3hIodAlNIevV8FOevCpb+9bo7c8P4UmyrGoVs2xPzxhrIoefxjoYKlQ6uO4f8QYoBdR9A9kmVPEXBqXn0kyI5+gm7YtCJ7pLFkMyBxS3b1EHOM9RKvGrSxI24os4WrUvq8SitEbBqe5lNb110RWG8y4PQ2eh1gm1bMuOcAiLeEKu+nayRhTqBcwLsWq5jlQDGFjcAM9h6HBNuyImzUzjyoStCZ4xREwOI8fTr8L9xMssi8UHsECrZq2xkS17EDjnyrdypPf5tQaRd6JUxdpxEokIgI6iTDXpZnOBjqeAQVGk0AzSri5PKm/cPiqmEXzA+j2M9ief3DYEh28qojyIDlboi51U4MFhm1fEo49RFqmKe7+JPhJ7SdPYpm0v/ws/REeCEhcbVjqOHeG7dIVOzTP7/8Ey0sWu3ACe30uzyzacNO/ThoXxTSxgzWz2zND1HyI9mzBkqe4Xheab+4/MI3nOaRjx28nui09YLiVrHxbr1CPfJngUrnW8d9K"

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
