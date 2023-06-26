variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "site_docker_image" {
  type    = string
  default = "ghcr.io/usa-reddragon/mc-mcswain-dev-site:latest"
}

variable "map_docker_image" {
  type    = string
  default = "ghcr.io/usa-reddragon/mc-mcswain-dev-map:latest"
}

variable "hostname" {
  type = string
}

variable "base_hostname" {
  type = string
}

variable "map_hostname" {
  type = string
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}
