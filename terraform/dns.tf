data "cloudflare_zone" "site-zone" {
  name = var.base_hostname
}

resource "cloudflare_record" "map" {
  zone_id = data.cloudflare_zone.site-zone.id
  name    = var.map_hostname
  value   = aws_eip.instance.public_ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "site" {
  zone_id = data.cloudflare_zone.site-zone.id
  name    = var.hostname
  value   = aws_eip.instance.public_ip
  type    = "A"
  proxied = false
}

resource "aws_eip" "instance" {
  instance = aws_instance.instance.id
  domain   = "vpc"
}
