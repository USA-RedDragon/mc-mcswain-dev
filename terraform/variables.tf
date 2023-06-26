variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "docker_image" {
  type    = string
  default = "ghcr.io/usa-reddragon/mc-mcswain-dev:latest"
}

variable "hostname" {
  sensitive = true
  type      = string
}

variable "server_minecraft_port" {
  type    = number
  default = 25565
}

variable "server_map_port" {
  type    = number
  default = 8123
}

variable "base_hostname" {
  sensitive = true
  type      = string
}

variable "map_hostname" {
  sensitive = true
  type      = string
}

variable "server_ip" {
  sensitive = true
  type      = string
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "acme_email" {
  type      = string
  sensitive = true
}
