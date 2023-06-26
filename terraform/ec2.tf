resource "aws_security_group" "deny-all-inbound" {
  name        = "${local.name}-deny-all-inbound"
  description = "Deny all inbound traffic"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 25565
    to_port          = 25565
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.server_minecraft_port
    to_port          = var.server_minecraft_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/userdata.sh")

  vars = {
    map_hostname          = var.map_hostname
    docker_image          = var.docker_image
    server_minecraft_port = var.server_minecraft_port
    server_ip             = var.server_ip
    server_map_port       = var.server_map_port
    hostname              = var.hostname
    acme_email            = var.acme_email
    cloudflare_api_token  = var.cloudflare_api_token
  }
}

resource "aws_instance" "instance" {
  availability_zone           = data.aws_availability_zones.available_zones.names[0]
  instance_type               = "t3a.small"
  ami                         = data.aws_ami.ubuntu.id
  iam_instance_profile        = aws_iam_instance_profile.profile.name
  associate_public_ip_address = true
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.deny-all-inbound.id]
  user_data_base64            = base64encode(data.template_file.userdata.rendered)

  user_data_replace_on_change = true
}
